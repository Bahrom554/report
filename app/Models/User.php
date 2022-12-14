<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable, HasRoles;

    public const ROLE_DEVELOPER = 'developer';
    public const ROLE_MANAGER = 'manager';
    public const ROLE_ADMIN = 'admin';
    public const ROLE_PENTESTER='pentester';
    public const ROLE_SOCENG='soceng';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name','avatar', 'password','username',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token','role'
    ];





    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
//    protected $casts = [
//        'email_verified_at' => 'datetime',
//    ];

    public function findForPassport($username)
    {
        return $this->where('username', $username)->first();
    }

    public static function rolesList(): array
    {
        return
            [   self::ROLE_DEVELOPER,
                self::ROLE_MANAGER,
                self::ROLE_PENTESTER,
                self::ROLE_SOCENG,
                self::ROLE_ADMIN
            ];
    }

    public function tasks(){
       return $this->hasMany(Task::class,'creator','id');
    }


}
