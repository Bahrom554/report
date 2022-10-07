<?php

namespace App\Http\Controllers\api\admin;
use App\Http\Controllers\Controller;
use App\Http\Requests\Target\TargetEditRequest;
use App\Http\Requests\Task\TaskCreateRequest;
use App\Http\Requests\Task\TaskEditRequest;
use App\Models\Target;
use App\Models\Task;
use App\Models\TaskItem;
use App\UseCases\TaskItemService;
use App\UseCases\TaskService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;

class TaskController extends Controller
{
    private $service;
    private $itemService;
    public function __construct(TaskService $service,TaskItemService $itemService)
    {
        $this->service=$service;
        $this->itemService=$itemService;
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
        $task = Task::findOrFail($id);
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

    public function store(TaskCreateRequest $request)
    {
        $task=$this->service->create($request);
        $taskItem=$this->itemService->create($request->taskItem);
        $taskItem->task_id=$task->id;
        $taskItem->save();
        return $task;
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function update(TaskEditRequest $request, Task $task)
    {
        $this->service->edit($task->id,$request);
        return Task::findOrFail($task->id);
    }
    public function destroy(Task $task)
    {
        $this->service->remove($task->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }
}
