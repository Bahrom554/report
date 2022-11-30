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
        $query->when($request->has('user'), function ($q) use ($request) {
            $q->whereJsonContains('assigned', (int)$request->user);
        });
        $query->when($request->has('start', 'end'), function ($q) use ($request) {
            $q->whereBetween('start', [$request->start, $request->end]);
            $q->orwhereBetween('deadline', [$request->start, $request->end]);
            $q->orWhere(function ($sq) use ($request) {
                $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
            });
        });
        $tasks = $query->paginate(15);
        foreach ($tasks as $task) {
            $task->items = $task->taskItems()->when($request->has('user'), function ($q) use ($request) {
                $q->where('user_id', (int)$request->user);
            })
                ->when($request->has('start', 'end'), function ($q) use ($request) {
                    $q->whereBetween('start', [$request->start, $request->end])
                        ->orwhereBetween('deadline', [$request->start, $request->end])
                        ->orWhere(function ($sq) use ($request) {
                            $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
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
        $target=Target::findOrFail($request->target);
        $target->results=$target->results()->when($request->has('start', 'end'), function ($q) use ($request) {
            $q->whereBetween('created_at', [$request->start, $request->end]); })->get();
         return $target;

    }

    public function objectReport(Request $request)
    {
        $all = Task::when($request->has('start', 'end'), function ($q) use ($request) {
            $q->whereBetween('start', [$request->start, $request->end])
                ->orwhereBetween('deadline', [$request->start, $request->end])
                ->orWhere(function ($sq) use ($request) {
                    $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
                });
        })->get();

        $tasks = [];

        foreach ($all as $task) {
            $t = 0;
            foreach ($task->taskItems()->get() as $tasItem) {
                if ($tasItem->object_id == $request->object_id) {
                    $t = 1;
                }
            }
            if ($t) {
                $tasks[] = $task;
            }
        }

        foreach ($tasks as $task) {
            $task->items = $task->taskItems()->where('object_id', (int)$request->object_id)
                ->when($request->has('start', 'end'), function ($q) use ($request) {
                    $q->whereBetween('start', [$request->start, $request->end])
                        ->orwhereBetween('deadline', [$request->start, $request->end])
                        ->orWhere(function ($sq) use ($request) {
                            $sq->where('start', '<', $request->start)->where('deadline', '>', $request->end);
                        });
                })->when($request->filled('filter'), function ($query) use ($request) {
                    [$criteria, $value] = explode(':', $request->filter);
                    return $query->where($criteria, $value);
                })
                ->get();
        }

        return $tasks;


    }


}
