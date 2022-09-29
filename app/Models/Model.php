<?php

namespace App\Models;

 use Illuminate\Database\Eloquent\Model as ParentModel;
class Model extends ParentModel
{
    protected $fillable =['name'];
    public const SEARCH_ITEMS =['name'];


    public static function createRules()
    {
        return [
            'name' => 'string|required|max:512',

        ];
    }
    public static function UpdateRules()
    {
        return [
            'name' => 'string|required|max:512',

        ];
    }
}
