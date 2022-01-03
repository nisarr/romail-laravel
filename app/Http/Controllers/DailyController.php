<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Inertia\Inertia;
use Automattic\WooCommerce\Client;

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

        $this->woocommerce = new Client(
            'http://romail.test', 
            'ck_ecbabce5c4c4ac6778c802a10e1b7c407a014ddf', 
            'cs_def890916fce0b61e027feb6778e61425e112ccc',
            [
                'version' => 'wc/v3',
            ]
        );

    }

    public function create(Request $request){

        $date = now()->setTimezone('Asia/Karachi')->format('Y-m-d');
 
        $preData = array();
        $preData['daily_cash_flow_bf'] = 33600;
        // $preData['daily_cash_flow_sales'] = $this->woocommerce->get('reports/sales',[
        //     'date_min' => $date,
        //     'date_max' => $date,
        // ])[0]->total_sales;
        
        $preData['daily_cash_flow_sales'] = 4625;

        $preData['parcel_detail_bf'] = 76;
        $preData['parcel_detail_amount_bf'] = 78425;
        
        $preData['bank_account_detail_bf'] = 18990;

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
