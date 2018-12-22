<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\LogingInController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::get('getSettings', function () {
//     return 'Hello World';
// });

Route::resource('getSettings', 'SettingsController');

Route::resource('EmployeesList', 'EmployeeController');

Route::resource('DepartmentsList', 'DepartmentController');

Route::resource('TemplatesList', 'TemplateController');



