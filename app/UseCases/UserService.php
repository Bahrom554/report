<?php
namespace App\UseCases;
use App\User;
use Illuminate\Http\Request;
use Laravel\Passport\Passport;


class UserService
{
    public function create($request)
    {
        $user = User::make($request->only('name', 'username','role'));
         if($request->has('password')){
             $user->password = bcrypt($request->password);
         }
        $user->save();
        return $user;
    }

    public function edit($id, $request){
        $user = $this->getUser($id);
        if($user->role!=User::ROLE_ADMIN){
            $user->update($request->only([
                'name',
                'username',
                'role',

            ]));
        }

        return $user;

    }
    public function userEdit($id, $request){
        $user = $this->getUser($id);
        $user->update($request->only([
            'name',
            'username',
        ]));
        return $user;

    }
    public function remove($id)
    {
        $user = $this->getUser($id);

        $user->delete();
    }
    public function resetPassword(Request $request , $id){
        $user=$this->getUser($id);
        $user->password = bcrypt($request->password);
        $user->save();
        return $user;
    }

    private function getUser($id):User
    {
        return User::findOrFail($id);
    }
}
