<?php

namespace App\Models;

use App\Models\Model;

class ResultType extends Model
{
    public function results(){
        return $this->hasMany(Result::class);
    }
}
