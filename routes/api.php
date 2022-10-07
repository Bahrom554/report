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
        Route::resource('users','ProfileController');
        Route::get('roles','ProfileController@roles');
        Route::put('users/{user}/change-password','ProfileController@changePassword');
    });

    Route::group(['namespace'=>'api\admin'],function () {
        Route::resource('country', 'CountryController');
        Route::resource('object-type', 'ObjectTypeController');
        Route::resource('target-type', 'TargetTypeController');
        Route::resource('target', 'TargetController');
        Route::resource('object', 'ObjectController');
        Route::resource('task', 'TaskController');
        Route::resource('task-item', 'TaskItemController');


    });
    //user route
    Route::group(['namespace'=>'api\user'],function (){
        Route::get('profile','ProfileController@show');
        Route::put('profile','ProfileController@update');
        Route::put('profile/change-password','ProfileController@changePassword');
        Route::resource('ip','IpController');
        Route::resource('result-type','ResultTypeController');
        Route::resource('result','ResultController');
    });

});
Route::post('image','ImageUploadController@store');
Route::delete('images/{image}','ImageUploadController@delete');
