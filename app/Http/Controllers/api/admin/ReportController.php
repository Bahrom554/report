<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Models\Report;
use App\Models\Result;
use App\Models\Target;
use App\Models\Task;
use App\Models\TaskItem;
use App\Models\User;
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
       $query = QueryBuilder::for(Task::class);
       $query->whereJsonContains('assigned',(int)$request->user);
       $query->where(function($q) use ($request){
           $q->whereBetween('start',[$request->start,$request->end]);
           $q->orwhereBetween('deadline',[$request->start,$request->end]);
           $q->orWhere(function($sq) use ($request){
               $sq->where('start','<',$request->start)->where('deadline','>',$request->end);
           });
       });
       $tasks= $query->get();
      foreach ($tasks as $task){
            $task->user=User::findOrFail($request->user)->name;
            $task->items=$task->taskItems()->where('user_id',(int)$request->user)
               ->where(function ($q) use ($request){
                   $q->whereBetween('start',[$request->start,$request->end])
                       ->orwhereBetween('deadline',[$request->start,$request->end])
                       ->orWhere(function($sq) use ($request){
                           $sq->where('start','<',$request->start)->where('deadline','>',$request->end);
                             });
               })->when($request->filled('filter'),function ($query) use($request){
                   [$criteria,$value]=explode(':',$request->filter);
                   return $query->where($criteria,$value);
                })
                ->get();
      }
      return $tasks;
    }


   public function targetReport(Request $request){
     $targets=Target::all();

   }

   public function objectReport(Request $request){



   }


}
