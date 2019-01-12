<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Setting;

class MainController extends Controller
{
    public function index()
    {
        $settings = Setting::first();
        return view('layouts/index', [
            'settings' => $settings,
        ]);
    }
}
