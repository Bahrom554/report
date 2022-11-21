<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Models\Report;
use App\Models\Task;
use App\Models\TaskItem;
use Illuminate\Support\Facades\DB;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ReportController extends Controller
{

    public function __construct()
    {
        $this->middleware(['can:adminormanager']);
    }

   public function userReport(Request $request){
       $filters = $request->get('filter');
       $filter = [];
       if (!empty($filters)) {
           foreach ($filters as $k => $item) {
               $filter[] = AllowedFilter::exact($k);
           }
       }
       $taskItems=DB::table('tasks')->join('task_items', 'tasks.id', '=', 'task_items.task_id')->select('task_items.id');
       $taskItems->whereJsonContains('tasks.assigned',(int)$request->user);
//       $taskItems->orwhereBetween('tasks.start',[$request->start,$request->end])->orWhereBetween('tasks.deadline',[$request->start,$request->end]);
//       $taskItems->orwhereBetween('task_items.start',[$request->start,$request->end])->orWhereBetween('task_items.deadline',[$request->start,$request->end]);
//       $taskItems->allowedFilters($filter);
       $ids=$taskItems->get();
       $taskItems=TaskItem::whereIn('id',$ids)->get();
       return $taskItems;
   }

   public function roleReport(Request $request){

   }

   public function targetReport(Request $request){

       $tasks=Task::all()->with('taskItem');
       return $tasks;
   }

   public function objectReport(Request $request){



   }


}
