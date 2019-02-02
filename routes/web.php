<?php

use Illuminate\Support\Facades\Auth;
use App\User;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'MainController@index')->name('logingin');


// Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');

Route::get('/signin', 'SignInController@index')->name('signin');

// Route::get('/admin', 'AdminController@index')->name('admin');

Route::get('/getUser', 'LogingInController@user');

Route::get('/home', 'MainController@index');
Route::get('/employees', 'MainController@index');

// Route::get('/admin/departments', 'MainController@index');
Route::get('/hrTemplates', 'MainController@index');
Route::get('/hrTemplates/create', 'MainController@index');
Route::get('/hrTemplate/view/{id}', 'MainController@index');

Route::get('/employees/create', 'MainController@index' );
Route::get('/departments', 'MainController@index' );
Route::get('/departments/create', 'MainController@index' );
Route::get('/leaves', 'MainController@index' );
Route::get('/login', 'MainController@index' );
Route::get('/myProfile', 'MainController@index' );
Route::get('/MyEmployees', 'MainController@index' );

// Route::get('/logout', 'AdminController@index' );

