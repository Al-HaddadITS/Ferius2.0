<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use App\Setting;

class AdminController extends Controller
{
    public function index()
    {
        $settings = Setting::first();
        if(!Auth::check()){
            return Redirect::to('/');
        }
        else{
            $auth_type = Auth::user()->type;
            if($auth_type != "admin"){
                return Redirect::to('signin');
            }
            else{
                return view('backend/'.$auth_type, [
                    // 'pagetitle' => 'Dashboard',
                    'settings' => $settings,
                    'user_type' => $auth_type
                    ]);
                // return "admin: ".$auth_type;
            }
        }
    }
    public function employees()
    {
        $settings = Setting::first();
        if(!Auth::check()){
            return Redirect::to('/');
        }
        else{
            $auth_type = Auth::user()->type;
            if($auth_type != "admin"){
                return Redirect::to('signin');
            }
            else{
                return view('backend/'.$auth_type, [
                    // 'pagetitle' => 'Employees',
                    'settings' => $settings,
                    'user_type' => $auth_type
                    ]);
                // return "admin: ".$auth_type;
            }
        }
    }
    public function employeesCreate()
    {
        $settings = Setting::first();
        if(!Auth::check()){
            return Redirect::to('/');
        }
        else{
            $auth_type = Auth::user()->type;
            if($auth_type != "admin"){
                return Redirect::to('signin');
            }
            else{
                return view('backend/'.$auth_type, [
                    // 'pagetitle' => 'Create Employee',
                    'settings' => $settings,
                    'user_type' => $auth_type
                    ]);
                // return "admin: ".$auth_type;
            }
        }
    }
    public function departments()
    {
        $settings = Setting::first();
        if(!Auth::check()){
            return Redirect::to('/');
        }
        else{
            $auth_type = Auth::user()->type;
            if($auth_type != "admin"){
                return Redirect::to('signin');
            }
            else{
                return view('backend/'.$auth_type, [
                    // 'pagetitle' => 'Departments',
                    'settings' => $settings,
                    'user_type' => $auth_type
                    ]);
                // return "admin: ".$auth_type;
            }
        }
    }
}
