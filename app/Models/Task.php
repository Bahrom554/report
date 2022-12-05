<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Auth;

class Task extends Model
{
    protected $fillable =['start','deadline', 'name','creator','assigned','assigned_role','files'];
    protected $casts = [
        'assigned' => 'array',
        'files' => 'array',
    ];
    protected $hidden = [
        'object_id', 'country_id',
    ];



    public function user(){
       return $this->belongsTo(User::class,'creator','id');
    }

    public function taskItems(){
        if(!(Auth::user()->role==User::ROLE_ADMIN || Auth::user()->role==User::ROLE_MANAGER)) {
           return $this->hasMany(TaskItem::class)->where('user_id',Auth::user()->id);
        }
       return $this->hasMany(TaskItem::class);
    }

    public function getMembersAttribute(){
        return User::whereIn('id',$this->assigned)->get();
    }

    public function getFiles0Attribute(){
        return Files::whereIn('id',$this->files)->get();
    }
}
