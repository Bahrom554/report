<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Task extends Model
{
    protected $fillable =['start','deadline', 'name','creator','assigned', 'targets','assigned_role','files'];
    protected $casts = [
        'assigned' => 'array',
        'targets' => 'array',
        'assigned_role' => 'array',
        'files' => 'array',
    ];

    public function user(){
        $this->belongsTo(User::class,'creator','id');
    }
    public function taskItems(){
        $this->hasMany(TaskItem::class);
    }
}
