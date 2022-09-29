<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Object extends Model
{
    protected $fillable =['name','country_id', 'code','object_type_id','address', 'cordination','phone','description'];
    public const SEARCH_ITEMS =['name','code','address','description'];


    public static function createRules()
    {
        return [
            'name' => 'required|string|max:512',
            'country_id'=>'nullable|integer',
             'code'=>'nullable|string',
             'object_type_id'=>'nullable|integer',
             'address'=>'nullable|string',
             'coordination'=>'',
             'phone'=>'',
             'mails'=>'',
             'description'=>'',


        ];
    }
    public static function UpdateRules()
    {
        return [
            'name' => 'string|required|max:512',

        ];
    }
}
