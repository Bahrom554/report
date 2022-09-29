<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\Controller;
use App\Http\Requests\user\UserEditRequest;
use App\Http\Resources\UserListResource;
use App\Models\User;
use App\UseCases\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Passport\Client;


class UserController extends Controller
{
    private $service;

    public function __construct(UserService $service)
    {
        $this->service = $service;
    }

    public function show()
    {
        $id=auth()->id();
        $user = User::findOrFail($id);
        return new UserListResource($user);
    }

    public function update(UserEditRequest $request)
    {
        $this->service->userEdit(auth()->id(), $request);
        return new UserListResource(User::findOrFail(auth()->id()));
    }

    function changePassword(Request $request)
    {
        $data = $request->all();
        $user = Auth::guard('api')->user();

        //Changing the password only if is different of null
        if (isset($data['oldPassword']) && !empty($data['oldPassword']) && $data['oldPassword'] !== "" && $data['oldPassword'] !== 'undefined') {
            //checking the old password first
            $check = Auth::guard('web')->attempt([
                'username' => $user['username'],
                'password' => $data['oldPassword']
            ]);
            if ($check && isset($data['newPassword']) && !empty($data['newPassword']) && $data['newPassword'] !== "" && $data['newPassword'] !== 'undefined') {
                $user->password = bcrypt($data['newPassword']);
                $user->token()->revoke();
                $user->save();
                $request->headers->set('Content-Type', 'application/x-www-form-urlencoded');
                $client = Client::where('password_client', 1)->first();
                $request->request->add([
                    "username" => $user['username'],
                    "password" => $data['newPassword'],
                    "client_id" => $client->id,
                    "client_secret" => $client->secret,
                    "grant_type" => 'password',
                    "scope" => '',
                ]);
                $tokenRequest = $request->create('/oauth/token', 'POST', $request->all());

                return app()->handle($tokenRequest);

            } else {
                return "Wrong password information";
            }
        }
        return "Wrong password information";
    }




}
