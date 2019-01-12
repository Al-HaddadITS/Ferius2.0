<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\LogingInController;


Route::group([
    'prefix' => 'auth'
], function () {
    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');

    Route::group([
      'middleware' => 'auth:api'
    ], function() {
        Route::get('logout', 'AuthController@logout');
        Route::get('user', 'AuthController@user');
    });
});


// Route::post('/login', 'AuthController@login')->name('login');


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::resource('getSettings', 'SettingsController');

Route::resource('EmployeesList', 'EmployeeController');

Route::resource('DepartmentsList', 'DepartmentController');

Route::resource('TemplatesList', 'TemplateController');



