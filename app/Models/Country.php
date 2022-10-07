<?php

namespace App\Models;

use App\Models\Model;

class Country extends Model
{
//    protected $with = ['targets'];

    public function targets(){
       return $this->hasMany(Target::class);
    }
    public function taskItems(){
       return $this->hasMany(TaskItem::class);
    }
    public function objects(){
      return  $this->hasMany(ObjectM::class);
    }
}
