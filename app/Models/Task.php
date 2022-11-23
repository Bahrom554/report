<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Task extends Model
{
    protected $fillable =['start','deadline', 'name','creator','assigned','assigned_role','files'];
    protected $casts = [
        'assigned' => 'array',
        'files' => 'array',
    ];



    public function user(){
       return $this->belongsTo(User::class,'creator','id');
    }

    public function taskItems(){
       return $this->hasMany(TaskItem::class);
    }

    public function getMembersAttribute(){
        return User::whereIn('id',$this->assigned)->get();
    }

    public function getFiles0Attribute(){
        return Files::whereIn('id',$this->files)->get();
    }
}
