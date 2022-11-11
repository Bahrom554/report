<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaskItem extends Model
{
    protected $fillable =[ 'object_id','task_id','country_id','start','deadline','target_id','files','definition'];
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
       return $this->belongsTo(ObjectM::class);
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

    public function getFiles0Attribute(){
      return Files::whereIn('id',$this->files)->get();
  }

}
