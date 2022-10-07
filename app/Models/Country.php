<?php

namespace App\Models;

use App\Models\Model;

class Country extends Model
{
    public function targets(){
        $this->hasMany(Target::class);
    }
    public function taskItems(){
        $this->hasMany(TaskItem::class);
    }
}
