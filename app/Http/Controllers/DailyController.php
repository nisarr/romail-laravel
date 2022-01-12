<?php

namespace App\Http\Controllers;

use App\Models\ParcelDetail;
use App\Models\User;
use Automattic\WooCommerce\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Inertia\Inertia;

class DailyController extends Controller
{
    public $woocommerce;

    public function __construct(){

        // PC
        // ck_ecbabce5c4c4ac6778c802a10e1b7c407a014ddf
        // cs_def890916fce0b61e027feb6778e61425e112ccc
            
        // Laptop
        // 'ck_f159d44554d66ee817748f36a24f5ec3670ace02', 
        // 'cs_9fba9d454faaaa771e570a3da23f7f2bea01db4e',

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

        $date = now()->setTimezone('Asia/Karachi')->format('Y-m-d');

        $http = Http::asForm()->post('http://romail.test/wp-admin/admin-ajax.php?action=codeinfaster_report&init_codeinfaster_apis=1',[
            'date' => $date
        ]);
        $response = ($http->json());
        // dd($response);
        $preData = array();
        $preData['daily_cash_flow_bf'] = 0;//33600;
        // $preData['daily_cash_flow_sales'] = $this->woocommerce->get('reports/sales',[
        //     'date_min' => $date,
        //     'date_max' => $date,
        // ])[0]->total_sales;

        $preData['daily_cash_flow_sales'] = $response['completed']['sale'];

        $preData['parcel_detail_bf'] = 0;//76;
        $preData['parcel_detail_current_orders'] = $response['pending']['total_orders'];
        $preData['parcel_detail_cash_received'] = $response['completed']['total_orders'];
        $preData['parcel_detail_returns'] = $response['return']['total_orders'];

        $preData['parcel_detail_bf_amount'] = 0;//78425;
        $preData['parcel_detail_current_orders_amount'] = $response['pending']['sale'];
        $preData['parcel_detail_cash_received_amount'] = $response['completed']['sale'];
        $preData['parcel_detail_returns_amount'] = $response['return']['sale'];

        $preData['bank_account_detail_bf'] = 0;//18990;
        $pendingOrders = $response['pending']['pending_report_orders'] ?? [];
        if(is_array($pendingOrders)){
            $pendingOrders = array_map(function($val){
                return $val[0];
            },$pendingOrders);
        }
        $preData['pendingOrders'] = $pendingOrders;
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

        // dd($request->pendingOrders);
        if(is_array($request->pendingOrders) && count($request->pendingOrders) > 1){
                $http = Http::asForm()->post('http://romail.test/wp-admin/admin-ajax.php?action=codeinfaster_report_update_orders&init_codeinfaster_apis=1',[
                'ids' => implode(',', $request->pendingOrders),
                'date' => $request->date_min." 00:00:00",
            ]);
        }
        
        $response = ($http->body());
  
        $parcel_detail = new ParcelDetail;
        $parcel_detail->date = $request->date_min;
        $parcel_detail->current_orders = $request->parcel_details['current_orders'];
        $parcel_detail->cash_received = $request->parcel_details['cash_received'];
        $parcel_detail->returns = $request->parcel_details['returns'];
        $parcel_detail->current_orders_amount = $request->parcel_details['current_orders_amount'];
        $parcel_detail->cash_received_amount = $request->parcel_details['cash_received_amount'];
        $parcel_detail->returns_amount = $request->parcel_details['returns_amount'];
        $parcel_detail->save();

        return redirect()->back();
         
    }
}
