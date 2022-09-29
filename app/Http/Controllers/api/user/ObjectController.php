<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\ApiController;
use App\Models\Object;

class ObjectController extends ApiController
{
    public $modelClass= Object::class;
}
