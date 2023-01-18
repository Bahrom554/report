<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class Result extends Model
{
   protected $fillable =['task_item_id','target_id','creator','result_type_id','description','files'];

//    protected $with=['resultType'];
    protected $appends=['files0'];
    protected $casts = [
        'files' => 'array'
    ];

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


    protected static function booted()
    {
        static::addGlobalScope('ability_result', function (Builder $builder) {
            if(!Gate::any(['admin','manager'])){
                $builder->where('creator',(int)Auth::user()->id);
            }
        });
    }

}
