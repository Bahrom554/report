<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Report\ReportCreateRequest;
use App\Http\Requests\Report\ReportEditRequest;
use App\Models\Report;
use App\UseCases\ReportService;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ReportController extends Controller
{
    private $service;
    public function __construct(ReportService $service)
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
        $query = QueryBuilder::for(Report::class);
        if (!empty($request->get('search'))){
            $query->where('name', 'like', '%'.$request->get('search').'%');

        }
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedFilters($filter);
        $query->allowedSorts($request->sort);
        return $query->paginate($request->per_page);
    }
    public function store(ReportCreateRequest $request)
    {
        return $this->service->create($request);
    }
    public function show(Request $request, $id)
    {
        $Report =Report::findOrFail($id);
        if (!empty($request->append)) {
            $Report->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $Report->load(explode(',', $request->include));
        }
        return $Report;
    }

    public function update(ReportEditRequest $request, Report $Report)
    {
        return  $this->service->edit($Report,$request);
    }
    public function destroy(Report $Report)
    {
        $this->service->remove($Report->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }


}
