<?php

namespace App\UseCases;
use App\Http\Requests\Task\TaskCreateRequest;
use App\Models\Task;
use App\Models\User;
use Illuminate\Auth\Access\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TaskService
{

    public function create(TaskCreateRequest $request)
    {    $user=Auth::user();
        $task = Task::make($request->only('start', 'deadline','name','assigned','files','assigned_role'));
        $task->creator=$user->id;
        if($user->hasRole(User::ROLE_MANAGER)){
            $task->assigned_role=$user->roles()->where('name','<>',User::ROLE_MANAGER)->firstOrFail()->id;
        }
        $task->save();
        return $task;
    }

    public function edit($id, $request){
        $task = $this->getTask($id);
        $task->update($request->only('start', 'deadline','name','assigned','files'));
        return $task;

    }
    public function remove($id)
    {
        $task = $this->getTask($id);
        $task->delete();
    }


    private function getTask($id):Task
    {
        return Task::findOrFail($id);
    }

}
