<?php

namespace App\Http\Controllers\api\admin;
use App\Http\Controllers\Controller;
use App\Http\Requests\admin\UserCreateRequest;
use App\Http\Requests\admin\UserEditRequest;
use App\Http\Resources\UserListResource;
use App\Models\User;
use App\UseCases\UserService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Spatie\QueryBuilder\QueryBuilder;
class UserController extends Controller
{
    private $service;
    public function __construct(UserService $service)
    {
       $this->service=$service;
    }
    public function index(Request $request)
    {
        $query = QueryBuilder::for(User::class);
        if (!empty(request()->get('search'))){
            $query->where('name', 'like', '%'.request()->get('search').'%')
                  ->orWhere('username', 'like', '%'.request()->get('search').'%')
                  ->orWhere('role', 'like', '%'.request()->get('search').'%');
        }
        $query->where('id','<>',Auth::id());
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedSorts(request()->sort);
        return $query->paginate(10);

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return UserListResource
     */


    public function store(UserCreateRequest $request)
    {
       $user=$this->service->create($request);
       return new UserListResource($user);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return UserListResource
     */
    public function show(User $user)
    {
      return new UserListResource($user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return UserListResource
     */
    public function update(UserEditRequest $request, User $user)
    {      $this->service->edit($user->id,$request);
        return new UserListResource(User::findOrFail($user->id));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(User $user)
    {
        if(!$user->hasRole(User::ROLE_ADMIN)){
            $this->service->remove($user->id);
        }
        return response()->json([], Response::HTTP_NO_CONTENT);
    }

    public function changePassword(Request $request,User $user){
        $this->validate($request,[
            'password'=>'required|confirmed|string|min:6',
        ]);
         $this->service->resetPassword($request,$user->id);
          DB::table('oauth_access_tokens')
              ->where('user_id', $user->id)->update([
                  'revoked' => true
              ]);
          return response()->json([], Response::HTTP_RESET_CONTENT);
    }

    public function assignRole(Request $request, User $user)
    {
        if ($user->hasAnyRole($request->role)) {
           return response()->json([], Response::HTTP_NOT_MODIFIED);
        }
        $user->syncRoles($request->role);
        if($user->hasRole(User::ROLE_ADMIN)){
            $user->syncRoles(User::ROLE_ADMIN);
        }
        return $user;
    }

    public function removeRole(User $user, Role $role)
    {
        if ($user->hasRole($role) ) {
            $user->removeRole($role);
             return response()->json([], Response::HTTP_NO_CONTENT);
        }

        return response()->json([], Response::HTTP_NOT_MODIFIED);
    }




}
