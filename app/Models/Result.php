<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

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
            }elseif(Gate::allows('manager')){
                $roles=Auth::user()->roles()->where('name','<>',User::ROLE_MANAGER)->pluck('id')->toArray();
                $users=DB::table('users')->rightJoin('model_has_roles','users.id','=','model_has_roles.model_id')->whereIn('model_has_roles.role_id',$roles)->pluck('id')->toArray();
                $builder->whereIn('creator',$users);
            }
        });
    }

}
