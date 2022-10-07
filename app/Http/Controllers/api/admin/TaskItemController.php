<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Task\TaskCreateRequest;
use App\Http\Requests\Task\TaskEditRequest;
use App\Http\Requests\TaskItem\TaskItemCreateRequest;
use App\Http\Requests\TaskItem\TaskItemEditRequest;
use App\Models\Task;
use App\Models\TaskItem;
use App\UseCases\TargetService;
use App\UseCases\TaskItemService;
use App\UseCases\TaskService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;

class TaskItemController extends Controller
{
    private $service;

    public function __construct(TaskItemService $service)
    {
        $this->service=$service;

        $this->middleware(['can:admin'|| 'can:manager'], ['except' => [
            'index',
            'show',
        ]]);
    }
    public function index(Request $request)
    {
        $filters = $request->get('filter');
        $filter = [];
        if (!empty($filters)) {
            foreach ($filters as $k => $item) {
                $filter[] = AllowedFilter::exact($k);
            }
        }
        $query = QueryBuilder::for(Task::class);
        if (!empty($request->get('search'))){
            $query->where('name', 'like', '%'.$request->get('search').'%');

        }
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedFilters($filter);
        $query->allowedSorts($request->sort);
        return $query->paginate($request->per_page);
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function show(Request $request, $id)
    {
        $task = TaskItem::findOrFail($id);
        if (!empty($request->append)) {
            $task->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $task->load(explode(',', $request->include));
        }
        return $task;
    }

    /**
     * @param Request $request
     * @param $slug
     * @return mixed
     */

    public function store(TaskItemCreateRequest  $request)
    {

        $task=$this->service->create($request);
        return $task;
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function update(TaskItemEditRequest  $request, TaskItem $taskItem)
    {
        $this->service->edit($taskItem->id,$request);
        return Task::findOrFail($taskItem->id);
    }
    public function destroy(TaskItem $taskItem)
    {
        $this->service->remove($taskItem->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }
}
