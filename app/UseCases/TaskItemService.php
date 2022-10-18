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
        $taskItem = TaskItem::make($request->only( 'object_id', 'task_id', 'country_id', 'start', 'deadline', 'files', 'definition'));
        $target = Target::where('name', $request->name)->first() ?: $this->service->create($request);
        $taskItem->target_id = $target->id;
        $taskItem->save();
        return $taskItem;
    }

    public function edit($id, $request)
    {
        $taskItem = $this->gettaskItem($id);
        $taskItem->update($request->only( 'object_id', 'task_id', 'country_id', 'target_id', 'start', 'deadline', 'files', 'definition'));
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
