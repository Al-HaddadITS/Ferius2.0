<?php

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

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/signin', 'SignInController@index')->name('signin');

// Route::get('/admin', 'AdminController@index')->name('admin');

Route::get('/getUser', 'LogingInController@user');

Route::get('/admin/home', 'MainController@index');
Route::get('/admin/employees', 'MainController@index');

Route::get('/admin/departments', 'MainController@index');
Route::get('/admin/hrTemplates', 'MainController@index');
Route::get('/admin/hrTemplates/create', 'MainController@index');
Route::get('/admin/hrTemplate/view/{id}', 'MainController@index');

Route::get('/admin/employees/create', 'MainController@index' );
Route::get('/admin/organizations', 'MainController@index' );
Route::get('/login', 'MainController@index' );

// Route::get('/logout', 'AdminController@index' );
