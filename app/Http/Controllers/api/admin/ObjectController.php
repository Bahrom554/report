<?php

namespace App\Http\Controllers\api\admin;
use App\Models\ObjectM;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\UseCases\ObjectService;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Spatie\QueryBuilder\QueryBuilder;
use Spatie\QueryBuilder\AllowedFilter;
use App\Http\Requests\Object\ObjectEditRequest;
use App\Http\Requests\Object\ObjectCreateRequest;
class ObjectController extends Controller
{
    private $service;
    public function __construct(ObjectService $service)
    {
        $this->service=$service;
        $this->middleware(['role:admin|manager'], ['except' => [
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
        $query = QueryBuilder::for(ObjectM::class);
        if (!empty($request->get('search'))){
            foreach (ObjectM::SEARCH_ITEMS as $searchItem){
                $query->orWhere($searchItem, 'like', '%'.$request->get('search').'%');
            }
        }
        if(Gate::any(['admin','manager'])) {
            $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        }

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
        $object =ObjectM::findOrFail($id);

        if (!empty($request->include) && Gate::any(['admin','manager'])) {
            $object->load(explode(',', $request->include));
        }
        return $object;
    }

    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $object
     * @return void
     */
    public function update(ObjectEditRequest $request, ObjectM $object)
    {
        $this->service->edit($object->id,$request);
        return ObjectM::findOrFail($object->id);
    }
    public function destroy(ObjectM $object)
    {
        $this->service->remove($object->id);
        return response()->json([], Response::HTTP_NO_CONTENT);
    }


}
