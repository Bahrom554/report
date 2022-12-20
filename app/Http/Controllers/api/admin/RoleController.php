<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Models\Role;
use Spatie\QueryBuilder\QueryBuilder;

class RoleController extends Controller

{   public function __construct()
{
    $this->middleware(['role:admin'],['only'=>'index']);
    $this->middleware(['role:admin|manager'],['only'=>'show']);
}
   public function index()
 {
    return Role::whereNotIn('name', ['admin'])->paginate(5);
 }

 public function show(Request $request, $id){

     $query=QueryBuilder::for(Role::class);
     $query->where('id',$id)->whereNotIn('name', ['admin']);
     if(Auth::user()->hasRole(User::ROLE_MANAGER)){
         $roles=Auth::user()->roles()->where('name','<>',User::ROLE_MANAGER)->pluck('id')->toArray();
         $query->where('id',$roles);
     }
     $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
       return $query->get();
 }
}
