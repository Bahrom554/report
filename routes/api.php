<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
;
Route::group(['middleware'=>'auth:api'],function () {
    // admin route
    Route::group(['middleware'=>'can:admin','namespace'=>'api\admin'],function (){
        Route::resource('users','UserController');
        Route::get('roles','UserController@roles');
        Route::put('users/{user}/change-password','UserController@changePassword');
    });
    //user route
    Route::group(['namespace'=>'api\user'],function (){
        Route::get('profile','UserController@show');
        Route::put('profile','UserController@update');
        Route::put('profile/change-password','UserController@changePassword');


    });





});
