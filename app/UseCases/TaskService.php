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
        $task->save();
        return $task;
    }
    public function edit($id, $request){
        $task = $this->getTask($id);
        if(Auth::id()==$task->creator || Auth::user()->hasRole(User::ROLE_ADMIN)){
            $task->update($request->only('start', 'deadline','name','assigned','assigned_role','files'));
        }
        return $task;
    }
    public function remove($id)
    {
        $task = $this->getTask($id);
        if(Auth::id()==$task->creator || Auth::user()->hasRole(User::ROLE_ADMIN)) {
            $task->delete();
        }
    }

    private function getTask($id):Task
    {
        return Task::findOrFail($id);
    }

}
