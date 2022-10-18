<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Target\TargetCreateRequest;
use App\Http\Requests\Target\TargetEditRequest;
use App\Models\Target;
use App\UseCases\TargetService;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class TargetController extends Controller
{
    private $service;
    public function __construct(TargetService $service)
    {
        $this->service=$service;
        $this->middleware(['can:adminormanager'], ['except' => [
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
        $query = QueryBuilder::for(Target::class);
        if (!empty($request->get('search'))){
            $query->where('name', 'like', '%'.$request->get('search').'%');

        }
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedFilters($filter);
        $query->allowedSorts($request->sort);
        return $query->paginate($request->per_page);
    }
    public function store(TargetCreateRequest $request)
    {
        return $this->service->create($request);
    }
    public function show(Request $request, $id)
    {
        $target =Target::findOrFail($id);
        if (!empty($request->append)) {
            $target->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $target->load(explode(',', $request->include));
        }
        return $target;
    }

    public function update(TargetEditRequest $request, Target $target)
    {
        $this->service->edit($target->id,$request);
        return Target::findOrFail($target->id);
    }
    public function destroy(Target $target)
    {
        $this->service->remove($target->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }


}
