<?php

namespace App\Http\Controllers\api\user;

use App\Models\User;
use App\Models\Result;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\UseCases\ResultService;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Spatie\QueryBuilder\QueryBuilder;
use Spatie\QueryBuilder\AllowedFilter;
use App\Http\Requests\Result\ResultEditRequest;
use App\Http\Requests\Result\ResultCreateRequest;

class ResultController extends Controller
{
    private $service;
    public function __construct(ResultService $service)
    {
        $this->service = $service;
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
        if (!(Auth::user()->role == User::ROLE_ADMIN || Auth::user()->role == User::ROLE_MANAGER)) {
            $query->where('creator', Auth::user()->id);
        }
        if (!empty($request->get('search'))) {
            $query->where('name', 'like', '%' . $request->get('search') . '%');
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
        $result = Result::findOrFail($id);
        if (!empty($request->append)) {
            $result->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $result->load(explode(',', $request->include));
        }
        return $result;
    }

    public function update(ResultEditRequest $request, Result $target)
    {
        $this->service->edit($target->id, $request);
        return Result::findOrFail($target->id);
    }
    public function destroy(Result $target)
    {
        $this->service->remove($target->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }
}
