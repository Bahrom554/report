<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\ApiController;
use App\Models\ObjectType;

class ObjectTypeController extends ApiController
{
    public $modelClass=ObjectType::class;
}
