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
        $this->middleware(['role:admin|manager'], ['except' => [
            'targetReport','userReport'
        ]]);
    }

    public function userReport(Request $request)
    {
        
        $query = QueryBuilder::for(Task::class);
        
        if ($request->filled('users')) {
            $users=json_decode($request->users, true);
            $query->where(function($query) use ($users){
                  foreach($users as $user){
                    $query->orwhereJsonContains('assigned',$user);
                }});
        }
         if ($request->filled('start') && $request->filled('end')) {
            $query->where(function ($q) use ($request) {
                $q->whereBetween('start', [$request->start, $request->end]);
                $q->orwhereBetween('deadline', [$request->start, $request->end]);
                $q->orWhere(function ($sq) use ($request) {
                    $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
                });
            });
        }
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $tasks = $query->get();
        foreach ($tasks as $task) {
            $task->task_items = $task->taskItems()->when($request->filled('users'), function ($q) use ($request) {
                $users=json_decode($request->users, true);
                if(!empty($users)){
                    $q->whereIn('user_id', $users);
                }
                })->when($request->filled(['start', 'end']), function ($q) use ($request) {
                $q->where(function ($query) use ($request) {
                    $query->whereBetween('start', [$request->start, $request->end]);
                    $query->orwhereBetween('deadline', [$request->start, $request->end]);
                    $query->orWhere(function ($sq) use ($request) {
                        $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
                    });
                });
            })->when($request->filled('filter'), function ($query) use ($request) {
                [$criteria, $value] = explode(':', $request->filter);
                return $query->where($criteria, $value);
            })->when($request->filled('include'), function ($q) use ($request) {
                $q->with(explode(',', $request->get('include')));
            })->get();
        }
        return $tasks;
    }


    public function targetReport(Request $request)
    {
        $target = Target::findOrFail($request->target);
        $results = $target->results()->when($request->filled(['start', 'end']), function ($q) use ($request) {
            $q->whereBetween('created_at', [$request->start, $request->end]);
        })->with('resultType', 'user')->get();
        return $results;

    }

    public function objectReport(Request $request)
    {
        $query = QueryBuilder::for(Target::class);
        $query->where('object_id', $request->object);
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $targets = $query->get();
        foreach ($targets as $target) {
            $target->results = $target->results()->when($request->filled(['start', 'end']), function ($q) use ($request) {
                $q->whereBetween('created_at', [$request->start, $request->end]);
            })->get();
        }
        return $targets;

    }


}
