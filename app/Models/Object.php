<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Object extends Model
{
    protected $fillable =['name','country_id', 'code','object_type_id','address', 'cordination','phone','description'];
    public const SEARCH_ITEMS =['name','code','address','description'];
    protected $casts = [
        'coordination' => 'array',
        'phone' => 'array',
        'mails' => 'array',
    ];

    public function country(){
        $this->belongsTo(Country::class);
    }
    public function objectType(){
        $this->belongsTo(ObjectType::class);
    }
    public function targets(){
        $this->hasMany(Target::class);
    }
    public function taskItems(){
        $this->hasMany(TaskItem::class);
    }




}
