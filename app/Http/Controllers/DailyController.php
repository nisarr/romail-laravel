<?php

namespace App\Http\Controllers;

use App\Models\BankAccountDetail;
use App\Models\DailyCashFlow;
use App\Models\EmployeeDetail;
use App\Models\ExpenseDetail;
use App\Models\ParcelDetail;
use App\Models\User;
use Automattic\WooCommerce\Client;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Inertia\Inertia;

class DailyController extends Controller
{
    public $woocommerce;
    public $wp_url = 'http://romail.test';

    public function __construct(){

        // PC
        // ck_ecbabce5c4c4ac6778c802a10e1b7c407a014ddf
        // cs_def890916fce0b61e027feb6778e61425e112ccc
            
        // Laptop
        // 'ck_f159d44554d66ee817748f36a24f5ec3670ace02', 
        // 'cs_9fba9d454faaaa771e570a3da23f7f2bea01db4e',

        // if(config('app.env') == 'production'){
           $this->wp_url = 'https://romailpublications.com';
        // }

        // $this->woocommerce = new Client(
        //     'https://romail.codeinfaster.com', 
        //     'ck_ecbabce5c4c4ac6778c802a10e1b7c407a014ddf', 
        //     'cs_def890916fce0b61e027feb6778e61425e112ccc',
        //     [
        //         'version' => 'wc/v3',
        //     ]
        // );

    }

    public function create(Request $request){

        if($request->query('date')){
            $date = $request->query('date');
        }else{
            $date = now()->setTimezone('Asia/Karachi')->format('Y-m-d');
        }

        $http = Http::asForm()->post($this->wp_url.'/wp-admin/admin-ajax.php?action=codeinfaster_report&init_codeinfaster_apis=1',[
            'date' => $date
        ]);
        $response = ($http->json());

        $dateCarbon = Carbon::parse($date);

        // YesterDay
        $yesterday = $dateCarbon->subDay();

        $parcelDetailYesterday = ParcelDetail::where('date',$yesterday)->first();
        $bankDetailYesterday = BankAccountDetail::where('date',$yesterday)->orderBy('id','desc')->first();
        $daily_cash_flow = DailyCashFlow::where('date',$yesterday)->first();
        
        // dd($response);
        $preData = array();
 
        $preData['daily_cash_flow_sales'] = $response['completed']['sale'];
        $preData['daily_cash_flow_bf'] =  $daily_cash_flow ? ($daily_cash_flow->cash_in_hand ?? 0) : 0;
        $preData['daily_cash_flow_bank_deposited'] = $daily_cash_flow ? ($daily_cash_flow->bank_deposited ?? 0) : 0;


        $preData['parcel_detail_bf'] = $parcelDetailYesterday ? ($parcelDetailYesterday->bf ?? 0) : 0;
        $preData['parcel_detail_current_orders'] = $response['pending']['total_orders'];
        $preData['parcel_detail_cash_received'] = $response['completed']['total_orders'];
        $preData['parcel_detail_returns'] = $response['return']['total_orders'];

        $preData['parcel_detail_bf_amount'] = $parcelDetailYesterday ? ($parcelDetailYesterday->bf_amount ?? 0) : 0;//78425;
        $preData['parcel_detail_current_orders_amount'] = $response['pending']['sale'];
        $preData['parcel_detail_cash_received_amount'] = $response['completed']['sale'];
        $preData['parcel_detail_returns_amount'] = $response['return']['sale'];

        $preData['bank_account_detail_bf'] = $bankDetailYesterday ? $bankDetailYesterday->bf : 0;//18990;
        $pendingOrders = $response['pending']['pending_report_orders'] ?? [];
        if(is_array($pendingOrders)){
            $pendingOrders = array_map(function($val){
                return $val[0];
            },$pendingOrders);
        }
        $preData['pendingOrders'] = $pendingOrders;

        $preData['expense_details'] = ExpenseDetail::where('date',$date)->get()->transform(function($item){
            return [
                'id' => $item->id,
                'title' => $item->field,
                'amount' => (string)$item->value,
            ];
        });

        $preData['bank_account_details'] = BankAccountDetail::where('date',$date)->get()->transform(function($item){
            return [
                'id' => $item->id,
                'bf' => $item->bf,
                'title' => $item->title,
                'cash_type' => $item->cash_type,
                'amount' => (string)$item->amount,
            ];
        });

        $preData['employees'] = EmployeeDetail::where('date',$date)->get()->transform(function($item){
            return [
                'id' => $item->id,
                'user_id' => $item->user_id,
                'time_in' => $item->time_in,
                'time_out' => $item->time_out,
            ];
        });
        // dd($preData);
        $preData['users'] = User::all();
        
        return Inertia::render('DailyReport/Create', [
            'dateMin' => $date,
            'dateMax' => $date,
            'preData' => $preData
            // 'filters' => Request::all('search', 'role', 'trashed'),
            // 'users' => Auth::user()->account->users()
            //     ->orderByName()
            //     ->filter(Request::only('search', 'role', 'trashed'))
            //     ->get()
            //     ->transform(fn ($user) => [
            //         'id' => $user->id,
            //         'name' => $user->name,
            //         'email' => $user->email,
            //         'owner' => $user->owner,
            //         'photo' => $user->photo_path ? URL::route('image', ['path' => $user->photo_path, 'w' => 40, 'h' => 40, 'fit' => 'crop']) : null,
            //         'deleted_at' => $user->deleted_at,
            //     ]),
        ]);

    }

    public function store(Request $request){

        // dd($request->all());
        if(is_array($request->pendingOrders) && count($request->pendingOrders) > 1){
                $http = Http::asForm()->post($this->wp_url.'/wp-admin/admin-ajax.php?action=codeinfaster_report_update_orders&init_codeinfaster_apis=1',[
                'ids' => implode(',', $request->pendingOrders),
                'date' => $request->date_min." 00:00:00",
            ]);

            // $response = ($http->body());
        }

        // Cash Flow
        $daily_cash_flow = DailyCashFlow::where('date',$request->date_min)->first();
        if(!$daily_cash_flow){
             $daily_cash_flow = new DailyCashFlow;
            $daily_cash_flow->date = $request->date_min;
        }
        $daily_cash_flow->cash_in_hand = $request->daily_cash_flow['cash_in_hand'];
        $daily_cash_flow->bank_deposited = $request->daily_cash_flow['bank_deposited'];
        $daily_cash_flow->save();
        // Cash Flow
        
        $parcel_detail = ParcelDetail::where('date',$request->date_min)->first();
        if(!$parcel_detail){
             $parcel_detail = new ParcelDetail;
            $parcel_detail->date = $request->date_min;
        }
        $parcel_detail->bf = $request->parcel_details['bf'];
        $parcel_detail->bf_amount = $request->parcel_details['bf_amount'];
        $parcel_detail->current_orders = $request->parcel_details['current_orders'];
        $parcel_detail->cash_received = $request->parcel_details['cash_received'];
        $parcel_detail->returns = $request->parcel_details['returns'];
        $parcel_detail->current_orders_amount = $request->parcel_details['current_orders_amount'];
        $parcel_detail->cash_received_amount = $request->parcel_details['cash_received_amount'];
        $parcel_detail->returns_amount = $request->parcel_details['returns_amount'];
        $parcel_detail->save();

        // Expense Details
        $updated_ExpenseDetail = [];
        foreach ($request->expense_details as $expense) {
            $ExpenseDetail = null;

            if(array_key_exists('id',$expense) && $expense['id']){
                $ExpenseDetail = ExpenseDetail::find($expense['id']);
            }

            if(!$ExpenseDetail){
                $ExpenseDetail = new ExpenseDetail;
                $ExpenseDetail->date = $request->date_min;
            }

            $ExpenseDetail->field = $expense['title'];
            $ExpenseDetail->value = $expense['amount'];
            $ExpenseDetail->save();

            $updated_ExpenseDetail[] = $ExpenseDetail->id;
        }

        if($updated_ExpenseDetail){
            ExpenseDetail::where('date',$request->date_min)->whereNotIn('id',$updated_ExpenseDetail)->delete();
        }
        // Expense Details

        // Bank Accounts
        $updated_BankAccount = [];
        foreach ($request->bank_account_details as $bank) {
            $BankAccount = null;

            if(array_key_exists('id',$bank) && $bank['id']){
                $BankAccount = BankAccountDetail::find($bank['id']);
            }

            if(!$BankAccount){
                $BankAccount = new BankAccountDetail;
                $BankAccount->date = $request->date_min;
            }

            $BankAccount->bf = $bank['bf'];
            $BankAccount->title = $bank['title'];
            $BankAccount->amount = $bank['amount'];
            $BankAccount->cash_type = $bank['cash_type'];
            $BankAccount->save();

            $updated_BankAccount[] = $BankAccount->id;
        }

        if($updated_BankAccount){
            BankAccountDetail::where('date',$request->date_min)->whereNotIn('id',$updated_BankAccount)->delete();
        }
        // Bank Accounts
        
        // Employee Accounts
        $updated_employees = [];
        foreach ($request->employees as $bank) {
            $employees = null;

            if(array_key_exists('id',$bank) && $bank['id']){
                $employees = EmployeeDetail::find($bank['id']);
            }

            if(!$employees){
                $employees = new EmployeeDetail;
                $employees->date = $request->date_min;
            }

            $employees->user_id = $bank['user_id'];
            $employees->time_in = $bank['time_in'];
            $employees->time_out = $bank['time_out'];
            $employees->save();

            $updated_employees[] = $employees->id;
        }

        if($updated_employees){
            EmployeeDetail::where('date',$request->date_min)->whereNotIn('id',$updated_employees)->delete();
        }
        // Employee Accounts

        return redirect()->back();
    }

    public function monthlyReport(Request $request){


        if($request->query('month')){
            $month = $request->query('month');
        }else{
            $month = now()->setTimezone('Asia/Karachi')->format('Y-m');
        }

        $from_date = Carbon::createFromFormat('Y-m',$month)->startOfMonth()->startOfDay()->format('Y-m-d H:i:s');
        $to_date = Carbon::createFromFormat('Y-m',$month)->endOfMonth()->endOfDay()->format('Y-m-d H:i:s');
        
        $http = Http::asForm()->post($this->wp_url.'/wp-admin/admin-ajax.php?action=codeinfaster_report_monthly&init_codeinfaster_apis=1',[
            'from_date' => $from_date,
            'to_date' => $to_date,
        ]);
        $response = ($http->json());
      
        $response['expense'] = ExpenseDetail::whereDate('date','>=',$from_date)->whereDate('date','<=',$to_date)->sum('value');

        $data = [
            'sale' => $response['sale'] ?? 0,
            'delivery_cost' => $response['delivery_cost'] ?? 0,
            'book_cost' => $response['book_cost'] ?? 0,
            'expense' => $response['expense'] ?? 0,
            'profit' => $response['sale'] - ($response['delivery_cost']+$response['book_cost']+$response['expense']),

            'total_orders' => $response['total_orders'] ?? 0,
            'total_completed_orders' => $response['total_completed_orders'] ?? 0,
            'total_pending_orders' => $response['total_pending_orders'] ?? 0,
            'total_orders_cash_received' => $response['total_orders_cash_received'] ?? 0,
        ];

        return Inertia::render('MonthlyReport/View', [
            'month' => $month,
            'data' => $data,
        ]); 

    }
}
