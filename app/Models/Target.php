<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Target extends Model
{
    protected $fillable =['name','target_type_id', 'object_type_id','object_id','parent_id', 'country_id','raw_name'];
    protected $casts = [
        'raw_name' => 'array',
    ];

    public function object(){
        $this->belongsTo(Object::class);
    }
    public function targetType(){
        $this->belongsTo(TargetType::class);
    }
    public function objectType(){
        $this->belongsTo(ObjectType::class);
    }
    public function country(){
        $this->belongsTo(Country::class);
    }
    public function targets(): HasMany
    {
        return $this->hasMany(Target::class, 'parent_id','id')->orderBy('sort', 'ASC');
    }
    public function taskItems(){
        $this->hasMany(TaskItem::class);
    }


}

