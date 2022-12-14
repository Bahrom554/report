<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class TaskItem extends Model
{
    protected $fillable =[ 'object_id','user_id','task_id','country_id','start','deadline','target_id','files','definition'];
    protected $casts = [
        'files' => 'array',
    ];
//    protected $with=['target','result','user'];
    protected $appends=['files0'];

    public function result(){
        return $this->hasone(Result::class,'task_item_id','id');
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

    protected static function booted()
    {
        static::addGlobalScope('ability_taskItem', function (Builder $builder) {
            if(!Gate::any(['admin','manager'])){
                $builder->where('user_id',Auth::user()->id);
            }

        });
    }

}
