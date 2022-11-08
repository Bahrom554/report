<?php

namespace App\UseCases;


use App\Models\Result;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ResultService
{
    public function create($request)
    {
        $result = Result::make($request->only('task_id', 'task_items','targets','result_type_id','description','files'));
        $result->creator=Auth::user()->id;
        $result->save();
        return $result;
    }

    public function edit($id, $request){
        $result = $this->getResult($id);
        $result->update($request->only('task_id', 'task_items','targets','result_type_id','description','files'));
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
