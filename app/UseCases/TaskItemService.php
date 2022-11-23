<?php

namespace App\UseCases;


use App\Models\Target;
use App\Models\TaskItem;


class TaskItemService
{
    private $service;

    public function __construct(TargetService $service)
    {
        $this->service = $service;
    }

    public function create($request)
    {
        $taskItem = TaskItem::make($request->only( 'target_id','user_id', 'task_id', 'start', 'deadline', 'files', 'definition'));
        $target=Target::findOrFail($request->target_id);
        $taskItem->country_id=$target->country_id;
        $taskItem->object_id=$target->object_id;
        $taskItem->save();
        return $taskItem;
    }

    public function edit(TaskItem $taskItem, $request)
    {
        $data=$request->only( 'task_id','target_id','user_id', 'start', 'deadline', 'files', 'definition');
        if($request->has('target_id')){
            $target=Target::findOrFail($request->target_id);
            $data['object_id']=$target->object_id;
            $data['country_id']=$target->country_id;
        }
        $taskItem->update($data);
        return $taskItem;

    }

    public function remove($id)
    {
        $taskItem = $this->gettaskItem($id);

        $taskItem->delete();
    }

    private function gettaskItem($id): TaskItem
    {
        return TaskItem::findOrFail($id);
    }


}
