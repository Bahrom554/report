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
        $this->belongsTo(TargetType::class);
    }
    public function objectType(){
        $this->belongsTo(ObjectType::class);
    }
    public function object(){
        $this->belongsTo(Object::class);
    }
    public function task(){
        $this->belongsTo(Task::class);
    }
    public function country(){
        $this->belongsTo(Country::class);
    }
    public function target(){
        $this->belongsTo(Target::class);
    }

}
