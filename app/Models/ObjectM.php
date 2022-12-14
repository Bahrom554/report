<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ObjectM extends Model
{
    protected $table='objects';
    protected $fillable =['name','country_id', 'code','object_type_id','mails','address', 'coordination','phone','description'];
    public const SEARCH_ITEMS =['name','code','address','description'];
    protected $casts = [
        'coordination' => 'array',
        'phone' => 'array',
        'mails' => 'array',
    ];

//    protected $with =['objectType','country'];
    public function country(){
       return $this->belongsTo(Country::class);
    }
    public function objectType(){
       return $this->belongsTo(ObjectType::class);
    }
    public function targets(){
       return $this->hasMany(Target::class,'object_id','id');
    }
    public function taskItems(){
       return $this->hasMany(TaskItem::class);
    }




}
