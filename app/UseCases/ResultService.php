<?php

namespace App\UseCases;


use App\Models\Result;
use App\Models\TaskItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ResultService
{
    public function create($request)
    {
        $result = Result::make($request->only( 'task_item_id','target_id','result_type_id','description','files'));
        if($request->has('task_item_id')){
            $taskItem=TaskItem::findOrFail($request->task_item_id);
            $taskItem->status=$request->status;
            $result->target_id=$taskItem->target_id;
            $taskItem->save();
        }
        $result->creator=Auth::user()->id;
        $result->save();
        return $result;
    }

    public function edit($id, $request){
        $result = $this->getResult($id);
        $result->update($request->only('task_item_id','target_id','result_type_id','description','files'));
        if ($result->taskItem !== null){
            $result->taskItem->update($request->only('status'));
        }

        return $result;

    }

    public function remove($id)
    {
        $user = $this->getResult($id);

        $user->delete();
    }

    private function getResult($id):Result
    {
        return Result::findOrFail($id);
    }
}
