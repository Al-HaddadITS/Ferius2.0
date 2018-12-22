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

Route::get('/', 'LogingInController@index')->name('logingin');


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/signin', 'SignInController@index')->name('signin');

Route::get('/admin', 'AdminController@index')->name('admin');

Route::get('/getUser', 'LogingInController@user');

Route::get('/admin/home', 'AdminController@index');
Route::get('/admin/employees', 'AdminController@index');

Route::get('/admin/departments', 'AdminController@index');
Route::get('/admin/hrTemplates', 'AdminController@index');
Route::get('/admin/hrTemplates/create', 'AdminController@index');
Route::get('/admin/hrTemplate/view/{id}', 'AdminController@index');

Route::get('/admin/employees/create', 'AdminController@index' );
