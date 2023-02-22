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
        return $this->service->list($request);
    }
    public function store(ResultCreateRequest $request)
    {
        return $this->service->create($request);
    }
    public function show(Request $request, $id)
    {
        return $this->service->show($request,$id);
        
    }
   public function update(ResultEditRequest $request, Result $result)
    {
      return $this->service->edit($result->id, $request);
        
    }
    public function destroy(Result $result)
    {
        return $this->service->remove($result->id);
     }


}
