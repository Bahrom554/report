<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Target extends Model
{
    protected $fillable =['name','target_type_id','object_id','user_id','parent_id','object_type_id','country_id','raw_name'];
    protected $casts = [
        'raw_name' => 'array',
    ];
//   protected $with=['targetType','object'];
    public function object(){
       return $this->belongsTo(ObjectM::class);
    }
    public function targetType(){
       return $this->belongsTo(TargetType::class);
    }
    public function objectType(){
       return $this->belongsTo(ObjectType::class);
    }
    public function country(){
       return $this->belongsTo(Country::class);
    }
    public function targets()
    {
      return $this->hasMany(Target::class, 'parent_id','id');
    }
    public function taskItems(){
       return $this->hasMany(TaskItem::class);
    }
    public function results(){
        return $this->hasMany(Result::class);
    }
    public function getParentattribute(){
        return Target::where('id',$this->parent_id)->get();
    }


}

