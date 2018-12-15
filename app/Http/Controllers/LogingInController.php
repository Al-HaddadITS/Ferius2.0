<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use App\Setting;

class LogingInController extends Controller
{
    //
    public function index()
    {
        if(Auth::check()){
            return Redirect::to('signin');
        }
        else{
            $settings = Setting::first();
            return view('login/index', [
                'pagetitle' => 'Login',
                'settings' => $settings
                ]);
        }
    }

    public function user()
    {
        return Auth::user();
    }
}
