<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class SignInController extends Controller
{

    public function index()
    {
        if(Auth::check()){
            $type=Auth::user()->type;
            if($type == "admin"){
                return Redirect::to('admin');
            }elseif($type == "employee"){
                return Redirect::to('home');
            }
        }
        else{
            return Redirect::to('/');
        }
    }
}
