<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\TaskItem\TaskItemCreateRequest;
use App\Http\Requests\TaskItem\TaskItemEditRequest;
use App\Models\Task;
use App\Models\TaskItem;
use App\Models\User;
use App\UseCases\TaskItemService;
use Illuminate\Auth\Access\Gate;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;

class TaskItemController extends Controller
{
    private $service;

    public function __construct(TaskItemService $service)
    {
        $this->service = $service;

        $this->middleware(['role:admin|manager'], ['except' => [
            'show',
            'index'
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
        $query = QueryBuilder::for(TaskItem::class);
        if (!empty($request->get('search'))) {
            $query->where('name', 'like', '%' . $request->get('search') . '%');
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
        $taskItem = TaskItem::findOrFail($id);

        if (!empty($request->append)) {
            $taskItem->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $taskItem->load(explode(',', $request->include));
        }
//        if(!$this->service->permissionToManager($taskItem)){
//            return response()->json([], Response::HTTP_UNAUTHORIZED);
//        }
        return $taskItem;
    }

    /**
     * @param Request $request
     * @param $slug
     * @return mixed
     */

    public function store(TaskItemCreateRequest $request)
    {
        return $this->service->create($request);
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function update(TaskItemEditRequest $request, TaskItem $taskItem)
    {
//        if(!$this->service->permissionToManager($taskItem)){
//            return response()->json([], Response::HTTP_UNAUTHORIZED);
//        }

        $this->service->edit($taskItem, $request);
        return TaskItem::findOrFail($taskItem->id);


    }

    public function destroy(TaskItem $taskItem)
    {
//        if(!$this->service->permissionToManager($taskItem)){
//            return response()->json([], Response::HTTP_UNAUTHORIZED);
//        }
        $this->service->remove($taskItem->id);
        return response()->json([], Response::HTTP_NO_CONTENT);



    }


}
