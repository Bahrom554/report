<?php

namespace App\UseCases;
use App\Http\Requests\Task\TaskCreateRequest;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TaskService
{
    public function create(TaskCreateRequest $request)
    {
        $task = Task::make($request->only('start', 'deadline','name','assigned','targets','files'));
        $task->creator=Auth::user()->id;
        $task->save();
        return $task;
    }

    public function edit($id, $request){
        $task = $this->getTask($id);
        $task->update($request->only('start', 'deadline','name','assigned','targets','files'));
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
