<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
   protected $fillable =['task_id','targets','task_items','creator','result_type_id','description','files'];

   public function task(){
      return $this->belongsTo(Task::class);
   }
   public function target(){
       return $this->belongsTo(Target::class);

   }
   public function resultType(){
       return $this->belongsTo(ResultType::class);

   }
   public function user(){
       return $this->belongsTo(User::class,'creator','id');
   }

   public function getFiles0Attribute(){
    return Files::whereIn('id',$this->files)->get();
   }
   public function getTaskItems0Attribute(){
    return TaskItem::whereIn('id',$this->task_items)->get();
}
public function getTargets0Attribute(){
    return Target::whereIn('id',$this->targets)->get();
}
protected $casts = [
    'task_items' => 'array',
    'targets' => 'array',
    'files' => 'array',
];


}
