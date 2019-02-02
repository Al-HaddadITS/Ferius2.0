<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\LogingInController;
use App\User;


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
        Route::get('myEmployee', 'AuthController@myEmployee');
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

Route::resource('Leaves', 'LeaveController');


Route::get('getAllPermissions/{id}', function($id) {
    $user = User::find($id);
    // $user->assignRole('manager');
    return $user->getAllPermissions();
});

Route::post('addPermission', 'MainController@addPermission');

Route::post('revokePermission', 'MainController@revokePermission');
