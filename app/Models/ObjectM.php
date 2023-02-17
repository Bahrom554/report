<?php

namespace App\Models;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class ObjectM extends Model
{
   
    protected $table='objects';
    protected $fillable =['name','country_id', 'code','object_type_id','mails','address', 'coordination','phone','description','assigned_role'];
    public const SEARCH_ITEMS =['name','code','address','description'];
    protected $casts = [
        'coordination' => 'array',
        'phone' => 'array',
        'assigned_role'=>'array',
        'mails' => 'array',
    ];

//    protected $with =['objectType','country'];
    public function country(){
       return $this->belongsTo(Country::class);
    }
    public function objectType(){
       return $this->belongsTo(ObjectType::class);
    }
    public function targets(){
       return $this->hasMany(Target::class,'object_id','id');
    }
    public function taskItems(){
       return $this->hasMany(TaskItem::class);
    }

    protected static function booted()
    {
        static::addGlobalScope('ability_object', function (Builder $builder) {
            if(!Gate::allows('admin')){
                $roles=Auth::user()->roles()->where('name','<>',User::ROLE_MANAGER)->pluck('id')->toArray();
                $builder->where(function($query) use ($roles){
                    foreach($roles as $role){
                        $query->orwhereJsonContains('assigned_role',$role);
                    }
                });
               
            }

        });
    }




}
