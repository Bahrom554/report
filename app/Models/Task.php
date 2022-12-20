<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class Task extends Model
{
    protected $fillable = ['start', 'deadline', 'name', 'creator', 'assigned', 'assigned_role', 'files'];
    protected $casts = [
        'assigned' => 'array',
        'assigned_role'=>'array',
        'files' => 'array',
    ];
    protected $hidden = [
        'object_id', 'country_id',
    ];
    public function user()
    {
        return $this->belongsTo(User::class, 'creator', 'id');
    }

    public function taskItems()
    {
        return $this->hasMany(TaskItem::class);
    }

    public function getMembersAttribute()
    {
        return User::whereIn('id', $this->assigned)->get();
    }

    public function getFiles0Attribute()
    {
        return Files::whereIn('id', $this->files)->get();
    }

    protected static function booted()
    {
        static::addGlobalScope('ability_task', function (Builder $builder) {
            if(!Gate::any(['admin','manager'])){
                $builder->whereJsonContains('assigned',(int)Auth::id());
            }
            elseif(Gate::allows('manager')){
                $roles=Auth::user()->roles()->where('name','<>',User::ROLE_MANAGER)->pluck('id')->toArray();
                $builder->whereJsonContains('assigned_role',$roles);
            }

        });
    }
}
