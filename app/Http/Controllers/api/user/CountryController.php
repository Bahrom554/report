<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\ApiController;
use App\Models\Country;

class CountryController extends ApiController
{
    public $modelClass =Country::class;
}
