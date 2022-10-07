<?php

namespace App\Http\Controllers\api\admin;


use App\Http\Controllers\Controller;
use App\Http\Requests\Object\ObjectCreateRequest;
use App\Http\Requests\Object\ObjectEditRequest;
use App\Models\Object;
use App\UseCases\ObjectService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;


class ObjectController extends Controller
{
    private $service;
    public function __construct(ObjectService $service)
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
        $query = QueryBuilder::for(Object::class);
        if (!empty($request->get('search'))){
            foreach (Object::SEARCH_ITEMS as $searchItem){
                $query->where($searchItem, 'like', '%'.$request->get('search').'%');
            }
        }
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $query->allowedFilters($filter);
        $query->allowedSorts($request->sort);
        return $query->paginate($request->per_page);
    }
    public function store(ObjectCreateRequest $request)
    {
        $object=$this->service->create($request);
        return $object;
    }
    public function show(Request $request, $id)
    {
        $object =Object::findOrFail($id);
        if (!empty($request->append)) {
            $object->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $object->load(explode(',', $request->include));
        }
        return $object;
    }

    public function update(ObjectEditRequest $request, Object $object)
    {
        $this->service->edit($object->id,$request);
        return Object::findOrFail($object->id);
    }
    public function destroy(Object $object)
    {
        $this->service->remove($object->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }


}
