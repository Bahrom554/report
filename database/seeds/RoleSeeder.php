<?php

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       $role= Role::create(['name' =>User::ROLE_ADMIN]);
        Role::create(['name' =>User::ROLE_MANAGER]);
        Role::create(['name' =>User::ROLE_DEVELOPER]);
        Role::create(['name' =>User::ROLE_PENTESTER]);
        Role::create(['name' =>User::ROLE_SOCENG]);

        $user =User::create([
            'name' => 'Super-Admin',
            'username' =>'superadmin@example.com',
            'avatar'=>'uploads/avatars/default.jpg',
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'remember_token' => Str::random(10),
        ]);
        $user->assignRole($role);

    }
}
