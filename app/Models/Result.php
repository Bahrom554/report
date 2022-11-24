<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
   protected $fillable =['task_item_id','target_id','creator','result_type_id','description','files'];

    protected $with=['resultType'];
    protected $appends=['files0'];


    public function taskItem(){
      return $this->belongsTo(TaskItem::class);
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

protected $casts = [
    'files' => 'array'
];


}
