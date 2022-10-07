<?php

namespace App\UseCases;


use App\Models\Target;
use App\Models\TaskItem;


class TaskItemService
{
    public function create($request)
    {
        $taskItem = TaskItem::make($request->only('target_type_id','object_type_id', 'object_id','task_id','country_id','start','deadline','files','definition'));
        if(filter_var($request->name, FILTER_VALIDATE_URL)){
            $request->name=$this->get_domain($request->name);
        }
        $target = Target::where('name',$request->name)->first() ? : Target::create($request->only( 'target_type_id','object_type_id','object_id','parent_id','country_id','name'));
        $taskItem->target_id=$target->id;
        $taskItem->save();
        return $taskItem;
    }

    public function edit($id, $request){
        $taskItem = $this->gettaskItem($id);
        $taskItem->update($request->only('target_type_id','object_type_id', 'object_id','task_id','country_id', 'target_id','start','deadline','files','definition'));

        return $taskItem;

    }

    public function remove($id)
    {
        $taskItem = $this->gettaskItem($id);

        $taskItem->delete();
    }

    private function gettaskItem($id):TaskItem
    {
        return TaskItem::findOrFail($id);
    }
    public function get_domain($url)
    {
        preg_match("/[a-z0-9\-]{1,63}\.[a-z\.]{2,6}$/", parse_url($url, PHP_URL_HOST), $_domain_tld);
        return $_domain_tld[0];
    }
}
