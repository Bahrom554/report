<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaskItem extends Model
{
    protected $fillable =['target_type_id','object_type_id', 'object_id','task_id','country_id', 'target_id','start','deadline','files','definition'];
    protected $casts = [
        'files' => 'array',
    ];

    public function targetType(){
       return $this->belongsTo(TargetType::class);
    }
    public function objectType(){
       return $this->belongsTo(ObjectType::class);
    }
    public function object(){
       return $this->belongsTo(Object::class);
    }
    public function task(){
       return $this->belongsTo(Task::class);
    }
    public function country(){
       return $this->belongsTo(Country::class);
    }
    public function target(){
       return $this->belongsTo(Target::class);
    }

}
