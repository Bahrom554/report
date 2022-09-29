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
use Illuminate\Support\Facades\DB;


class UserController extends Controller
{
    private $service;
    public function __construct(UserService $service)
    {
       $this->service=$service;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function index()
    {
       $users=User::paginate(10);
       return $users;
//       return UserListResource::collection($users);
    }


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
    {

      $this->service->edit($user->id,$request);
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
      $this->service->remove($user->id);
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

    public function roles(): array
    {
        return User::rolesList();
    }
}
