<?php

namespace App\Models;

use App\Models\Model;

class TargetType extends Model
{
    public function targets(){
       return $this->hasMany(Target::class);
    }
    public function taskItems(){
       return $this->hasMany(TaskItem::class);
    }
}
