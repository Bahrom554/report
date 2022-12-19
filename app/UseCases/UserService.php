<?php
namespace App\UseCases;
use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;


class UserService
{
    public function create($request)
    {
        $user = User::make($request->only('name', 'username'));
         if($request->has('password')){
             $user->password = bcrypt($request->password);
         }
        $user->save();
        if($request->filled('role')) {
            $user->syncRoles($request->role);
            if ($user->hasRole(User::ROLE_ADMIN) )
            {
                $user->removeRole(User::ROLE_ADMIN);
            }
        }
        return $user;
    }


    public function edit($id, $request){
        $user = $this->getUser($id);
        $user->update($request->only([
            'name',
            'username',
        ]));
        if($request->filled('role')){
            if (!$user->hasAnyRole($request->role) && !$user->hasRole(User::ROLE_ADMIN)) {
                    $user->syncRoles($request->role);
                if ($user->hasRole(User::ROLE_ADMIN) )
                {
                    $user->removeRole(User::ROLE_ADMIN);
                }
                }
            }


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
