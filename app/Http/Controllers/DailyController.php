<?php

namespace App\Http\Controllers;

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

        $http = Http::get('http://romail.test/wp-admin/admin-ajax.php?action=codeinfaster_report&init_codeinfaster_apis=1');
        $response = ($http->json());
        // dd($response);
        $preData = array();
        $preData['daily_cash_flow_bf'] = 33600;
        // $preData['daily_cash_flow_sales'] = $this->woocommerce->get('reports/sales',[
        //     'date_min' => $date,
        //     'date_max' => $date,
        // ])[0]->total_sales;

        $preData['daily_cash_flow_sales'] = $response['completed']['sale'];

        $preData['parcel_detail_bf'] = 76;
        $preData['parcel_detail_current_orders'] = $response['pending']['total_orders'];
        $preData['parcel_detail_cash_received'] = $response['completed']['total_orders'];
        $preData['parcel_detail_returns'] = $response['return']['total_orders'];

        $preData['parcel_detail_bf_amount'] = 78425;
        $preData['parcel_detail_current_orders_amount'] = $response['pending']['total_orders'];
        $preData['parcel_detail_cash_received_amount'] = $response['completed']['total_orders'];
        $preData['parcel_detail_returns_amount'] = $response['return']['total_orders'];

        $preData['bank_account_detail_bf'] = 18990;
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

        $reports_data = $this->woocommerce->get('reports/sales',[
            'date_min' => $request->date_min,
            'date_max' => $request->date_min,
        ]);

        dd($reports_data[0]->total_sales);

    }
}
