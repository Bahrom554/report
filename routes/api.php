<?php

use App\Models\Result;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


Route::group(['middleware'=>['auth:api','role:'.User::ROLE_ADMIN.'|'.User::ROLE_MANAGER.'|'.User::ROLE_DEVELOPER.'|'.User::ROLE_SOCENG.'|'.User::ROLE_PENTESTER]],function () {
    Route::group(['namespace'=>'api\admin'],function (){
        Route::resource('users','UserController');
        Route::get('roles','RoleController@index');
        Route::get('roles/{role}', 'RoleController@show');
        Route::post('users/{user}/roles',  'UserController@assignRole');
        Route::delete('/users/{user}/roles/{role}', 'UserController@removeRole');
        Route::put('users/{user}/change-password','UserController@changePassword');
    });

    Route::group(['namespace'=>'api\admin'],function () {
        Route::resource('country', 'CountryController');
        Route::resource('object-type', 'ObjectTypeController');
        Route::resource('target-type', 'TargetTypeController');
        Route::resource('object', 'ObjectController');
        Route::resource('task', 'TaskController');
        Route::get('tasks/{task}/user','TaskController@users');
        Route::resource('task-item', 'TaskItemController');
        Route::get('userReport','ReportController@userReport');
        Route::get('targetReport','ReportController@targetReport');
        Route::get('objectReport','ReportController@objectReport');


    });
    //user route
    Route::group(['namespace'=>'api\user'],function (){
        Route::get('profile','ProfileController@show');
        Route::put('profile','ProfileController@update');
        Route::put('profile/change-password','ProfileController@changePassword');
        Route::resource('ip','IpController');
        Route::resource('result-type','ResultTypeController');
        Route::resource('result','ResultController');
        Route::get('file', 'FilemanagerController@index');
        Route::delete('file/{id}', 'FilemanagerController@delete');
        Route::post('file', 'FilemanagerController@uploads');
        Route::resource('target', 'TargetController');
    });

});

