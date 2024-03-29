<?php

namespace App\UseCases;

use App\Http\Resources\UserListResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Spatie\QueryBuilder\QueryBuilder;


class UserService
{
    public function index(Request $request)
    {

        $query = QueryBuilder::for(User::class);
        if (!empty(request()->get('search'))) {
            $query->where('name', 'like', '%' . request()->get('search') . '%')
                ->orWhere('username', 'like', '%' . request()->get('search') . '%')
                ->orWhere('role', 'like', '%' . request()->get('search') . '%');
        }
        if (Auth::user()->hasRole(User::ROLE_MANAGER)) {
            $roles = Auth::user()->roles()->where('name', '<>', User::ROLE_MANAGER)->pluck('id')->toArray();
            $users = DB::table('users')->rightJoin('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')->whereIn('model_has_roles.role_id', $roles)->pluck('id')->toArray();
            $query->whereIn('id', $users);
        }
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedSorts(request()->sort);
        return $query->paginate(10);
    }

    public function create($request){
        DB::beginTransaction();
        try {
            $user = User::make($request->only('name', 'username'));
            if ($request->has('password')) {
                $user->password = bcrypt($request->password);
            }
            $user->save();
            // assign role
            if ($request->filled('role')) {
                $user->syncRoles($request->role);
                if ($user->hasRole(User::ROLE_ADMIN)) {
                    $user->removeRole(User::ROLE_ADMIN);
                }
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()]);
        }
        return $user;
    }


    public function edit($id, $request){
        $user = $this->getUser($id);
        $user->update($request->only([
            'name',
            'username',
        ]));
        if ($request->filled('role')) {
            if (!$user->hasRole(User::ROLE_ADMIN)) {
                $user->syncRoles($request->role);
                if ($user->hasRole(User::ROLE_ADMIN)) {
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
    public function resetPassword(Request $request, $id)
    {
        $user = $this->getUser($id);
        $user->password = bcrypt($request->password);
        $user->save();
        return $user;
    }

    private function getUser($id): User
    {
        return User::findOrFail($id);
    }
}
