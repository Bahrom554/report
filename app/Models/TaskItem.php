<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaskItem extends Model
{
    protected $fillable =[ 'object_id','user_id','task_id','country_id','start','deadline','target_id','files','definition'];
    protected $casts = [
        'files' => 'array',
    ];
    protected $with=['target','results','user'];
    protected $appends=['files0'];

    public function results(){
        return $this->hasMany(Result::class,'task_item_id','id');
    }
    public function object(){
       return $this->belongsTo(ObjectM::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
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
