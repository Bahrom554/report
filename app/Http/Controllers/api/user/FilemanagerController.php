<?php

namespace App\Http\Controllers\api\user;

use App\Http\Controllers\Controller;
use App\Models\Files;
use App\UseCases\FileService;
use Faker\Core\File;
use Illuminate\Http\Request;
use App\Dto\GeneratePathFileDTO;
use Illuminate\Support\Facades\Storage;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;

/**
 * @group Filemanager - Filemanager
 *
 */
class FilemanagerController extends Controller
{
    private $service;

    public function __construct(FileService $service)
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

        $query = QueryBuilder::for(Files::class);
        if (!empty($request->title)) {
            $query->where('title', 'LIKE', '%' . $request->title . '%');
        }
        $query->allowedFilters($filter);
        $query->allowedAppends($request->include);
        $query->allowedSorts($request->sort);
        $files=$query->paginate($request->per_page);
        return view('user.images',compact('files'));
    }

    /**
     * Filemanager Uploads
     *
     * @bodyParam files file required File
     */
    public function uploads(Request $request)
    {

     return $this->service->uploads($request);
    }
    public function delete($id)
    {
        $file = Files::findOrFail($id);
       $this->service->delete($file);
        $file->delete();

        return 'deleted';
    }
}
