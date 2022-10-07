<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;

class ApiController extends Controller
{
    public $modelClass;
    public function __construct()
    {
        $this->middleware(['can:adminormanager'], ['except' => [
            'index',
            'show',
        ]]);
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function index(Request $request)
    {
        $filters = $request->get('filter');
        $filter = [];
        if (!empty($filters)) {
            foreach ($filters as $k => $item) {
                $filter[] = AllowedFilter::exact($k);
            }
        }
        $query = QueryBuilder::for($this->modelClass);
        if (!empty($request->get('search'))){
            foreach ($this->modelClass::SEARCH_ITEMS as $searchItem){
                $query->where($searchItem, 'like', '%'.$request->get('search').'%');
            }
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
        $model = $this->modelClass::findOrFail($id);
        if (!empty($request->append)) {
            $model->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $model->load(explode(',', $request->include));
        }
        return $model;
    }

    /**
     * @param Request $request
     * @param $slug
     * @return mixed
     */

    public function store(Request $request)
    {


        $request->validate($this->modelClass::createRules());
//        $model = $this->modelClass::firstOrCreate($request->all());
        $model = $this->modelClass::create($request->all());

        if (!empty($request->append)) {
            $model->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $model->load(explode(',', $request->include));
        }

        return $model;
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function update(Request $request, $id)
    {

        $request->validate($this->modelClass::UpdateRules());
        $model = $this->modelClass::findOrFail($id);
        $model->update($request->all());

        if (!empty($request->append)) {
            $model->append(explode(',', $request->append));
        }
        if (!empty($request->include)) {
            $model->load(explode(',', $request->include));
        }

        return $model;
    }

    /**
     * @param $id
     * @return string
     */
    public function destroy(int $id)
    {
        $model = $this->modelClass::findOrFail($id);
        $model->delete();
        return response()->json('deleted', 204);
    }
}