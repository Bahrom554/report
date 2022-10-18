<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\Controller;
use App\Http\Requests\Result\ResultCreateRequest;
use App\Http\Requests\Result\ResultEditRequest;
use App\Models\Result;
use App\UseCases\ResultService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;

class ResultController extends Controller
{
    private $service;
    public function __construct(ResultService $service)
    {
        $this->service=$service;

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
        $query = QueryBuilder::for(Result::class);
        if (!empty($request->get('search'))){
            $query->where('name', 'like', '%'.$request->get('search').'%');

        }
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedFilters($filter);
        $query->allowedSorts($request->sort);
        return $query->paginate($request->per_page);
    }
    public function store(ResultCreateRequest $request)
    {
        return $this->service->create($request);
    }
    public function show(Request $request, $id)
    {
        $target =Result::findOrFail($id);
        if (!empty($request->append)) {
            $target->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $target->load(explode(',', $request->include));
        }
        return $target;
    }

    public function update(ResultEditRequest $request, Result $target)
    {
        $this->service->edit($target->id,$request);
        return Result::findOrFail($target->id);
    }
    public function destroy(Result $target)
    {
        $this->service->remove($target->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }

}
