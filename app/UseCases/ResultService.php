<?php

namespace App\UseCases;

use App\Models\User;
use App\Models\Result;
use App\Models\TaskItem;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Spatie\QueryBuilder\QueryBuilder;
use Spatie\QueryBuilder\AllowedFilter;

class ResultService
{

    public function list(Request $request)
    {
        $filters = $request->get('filter');
        $filter = [];
        if (!empty($filters)) {
            foreach ($filters as $k => $item) {
                $filter[] = AllowedFilter::exact($k);
            }
        }
        $query = QueryBuilder::for(Result::class);
        if (!empty($request->get('search'))) {
            $query->where('name', 'like', '%' . $request->get('search') . '%');
        }
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedFilters($filter);
        $query->allowedSorts($request->sort);
        return $query->paginate($request->per_page);
    }

    public function create($request)
    {
        DB::beginTransaction();
        try {
            if ($request->has('task_item_id')) {
                $taskItem = TaskItem::findOrFail($request->task_item_id);
                if (!$this->permission($taskItem)) {
                    return response()->json([], Response::HTTP_UNAUTHORIZED);
                }
                $taskItem->status = $request->status ?: "waiting";
                $result = Result::make($request->only('task_item_id', 'target_id', 'result_type_id', 'description', 'files', 'degree'));
                $result->target_id = $taskItem->target_id;
                $result->creator = $taskItem->user_id;
                $taskItem->save();
                $result->save();
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error'=>$e->getMessage()]);
        }
        return $result;
    }

    public function edit($id, $request)
    {
        DB::beginTransaction();
        try {
            $result = $this->getResult($id);
             if ($result->taskItem !== null) {
                $result->taskItem->update($request->only('status'));
            }
            $result->update($request->only('task_item_id', 'target_id', 'result_type_id', 'description', 'files', 'degree'));
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error'=>$e->getMessage()]);
        }
        return $result;
    }

    public function show(Request $request, $id)
    {
        $result = $this->getResult($id);
        if (!empty($request->append)) {
            $result->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $result->load(explode(',', $request->include));
        }
        return $result;
    }

    public function remove($id)
    {
        $result = $this->getResult($id);
        if ($result->taskItem !== null) {
            $result->taskItem->status = "waiting";
        }
        $result->delete();
        return response()->json([], Response::HTTP_NO_CONTENT);
    }

    private function getResult($id): Result
    {
        return Result::findOrFail($id);
    }

    private function permission(TaskItem $taskItem)
    {
        if ($taskItem->user_id == Auth::id() || Auth::user()->hasRole(User::ROLE_MANAGER)) {
            return true;
        }
        return false;
    }
}
