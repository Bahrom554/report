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

    public function userReport(Request $request)
    {
        $query = QueryBuilder::for(Task::class);

        if ($value = $request->user) {
            $query->whereJsonContains('assigned', (int)$value);
        }

        if ($request->has('start') && $request->has('end')) {
            $query->where(function ($q) use ($request) {
                $q->whereBetween('start', [$request->start, $request->end]);
                $q->orwhereBetween('deadline', [$request->start, $request->end]);
                $q->orWhere(function ($sq) use ($request) {
                    $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
                });
            });

        }
        $tasks = $query->paginate(15);
        foreach ($tasks as $task) {
            $task->items = $task->taskItems()->when($request->has('user'), function ($q) use ($request) {
                $q->where('user_id', (int)$request->user);
            })
                ->when($request->has('start', 'end'), function ($q) use ($request) {
                    $q->where(function ($query) use ($request) {
                        $query->whereBetween('start', [$request->start, $request->end])
                            ->orwhereBetween('deadline', [$request->start, $request->end])
                            ->orWhere(function ($sq) use ($request) {
                                $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
                            });
                    });
                })->when($request->filled('filter'), function ($query) use ($request) {
                    [$criteria, $value] = explode(':', $request->filter);
                    return $query->where($criteria, $value);
                })
                ->get();
        }
        return $tasks;
    }


    public function targetReport(Request $request)
    {
        $target = Target::findOrFail($request->target);
        $target->results = $target->results()->when($request->has('start', 'end'), function ($q) use ($request) {
            $q->whereBetween('created_at', [$request->start, $request->end]);
        })->get();
        return $target;

    }

    public function objectReport(Request $request)
    {
        $query = QueryBuilder::for(Target::class);
        $query->where('object_id', $request->object);
        $query->allowedAppends(!empty($request->append) ? explode(',', $request->get('append')) : []);
        $query->allowedIncludes(!empty($request->include) ? explode(',', $request->get('include')) : []);
        $targets=$query->paginate(2);
        foreach ($targets as $target) {
            $target->results = $target->results()->when($request->has('start', 'end'), function ($q) use ($request) {
                $q->whereBetween('created_at', [$request->start, $request->end]);
            })->get();
        }
        return $targets;

    }


}
