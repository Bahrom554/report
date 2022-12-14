<?php

namespace App\UseCases;


use App\Models\Result;
use App\Models\TaskItem;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ResultService
{
    public function create($request)
    {
        $result = Result::make($request->only( 'task_item_id','target_id','result_type_id','description','files'));
        if($request->has('task_item_id')){
            $taskItem=TaskItem::findOrFail($request->task_item_id);
            $taskItem->status=$request->status ? : "waiting";
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
        $result = $this->getResult($id);
        if ($result->taskItem !== null){
            $result->taskItem->update($request->only('status'));
        }

        return $result;

    }

    public function remove($id)
    {
        $result = $this->getResult($id);
        if ($result->taskItem !== null){
            $result->taskItem->status="waiting";
        }
        $result->delete();
    }

    private function getResult($id):Result
    {
        return Result::findOrFail($id);
    }

    public function permissionToManager(Result $result){
        $status=false;
        if(Auth::user()->hasRole('manager') ){
            if($role=Auth::user()->roles()->where('name','<>',User::ROLE_MANAGER)->first()){
                if($role->users()->find($result->creator)){
                    $status=true;
                }
            }
        }
        else{
            $status=true;
        }
        return $status;

    }
}
