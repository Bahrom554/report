<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\ApiController;
use App\Models\Ip;

class IpController extends ApiController
{
    public $modelClass =Ip::class;
}
