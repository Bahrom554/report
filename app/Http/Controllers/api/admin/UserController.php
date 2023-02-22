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
        $this->service = $service;
        $this->middleware(['role:admin'], ['except' => [
            'index',
        ]]);
        $this->middleware(['role:admin|manager'], ['only' => [
            'index',
        ]]);
    }
    public function index(Request $request)
    {
        return $this->service->index($request);
    }
    public function store(UserCreateRequest $request)
    {
        $user = $this->service->create($request);

        return new UserListResource($user);
    }


    public function show(User $user)
    {
        return new UserListResource($user);
    }


    public function update(UserEditRequest $request, User $user)
    {
        $this->service->edit($user->id, $request);
        if ($request->has('password')) {
            $this->service->resetPassword($request, $user->id);
            DB::table('oauth_access_tokens')
                ->where('user_id', $user->id)->update([
                    'revoked' => true
                ]);
        }

        return new UserListResource(User::findOrFail($user->id));
    }
    public function destroy(User $user)
    {
        if (!$user->hasRole(User::ROLE_ADMIN)) {
            $this->service->remove($user->id);
        }
        return response()->json([], Response::HTTP_NO_CONTENT);
    }

    public function changePassword(Request $request, User $user)
    {
        $this->validate($request, [
            'password' => 'required|confirmed|string|min:6',
        ]);
        $this->service->resetPassword($request, $user->id);
        DB::table('oauth_access_tokens')
            ->where('user_id', $user->id)->update([
                'revoked' => true
            ]);
        return response()->json([], Response::HTTP_RESET_CONTENT);
    }
}
