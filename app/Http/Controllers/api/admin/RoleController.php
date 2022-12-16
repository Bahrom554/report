<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\QueryBuilder\QueryBuilder;

class RoleController extends Controller

{
   public function index()
 {
    return Role::whereNotIn('name', ['admin'])->paginate(5);
    
 }

 public function show(Request $request, $id){

       $query=QueryBuilder::for(Role::class);
     $query->where('id',$id)->whereNotIn('name', ['admin']);
     $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
       return $query->get();
 }
}
