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
 
        // dd($this->woocommerce->get('reports/sales',[
        //     'date_min' => 'YYYY-MM-DD'
        // ]));
        // ck_ecbabce5c4c4ac6778c802a10e1b7c407a014ddf
        // cs_def890916fce0b61e027feb6778e61425e112ccc
        return Inertia::render('DailyReport/Create', [
            'dateMin' => now()->format('Y-m-d'),
            'dateMax' => now()->format('Y-m-d'),
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

        dd($request->all());

    }
}
