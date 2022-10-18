<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
   protected $fillable =['task_id','target_id','task_items','creator','result_type_id','description','files'];

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


}
