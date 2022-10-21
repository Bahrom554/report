<?php

namespace App\Http\Requests\Task;

use Illuminate\Foundation\Http\FormRequest;

class TaskCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */


    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'start'=>'required|date',
            'deadline'=>'required|date',
            'name'=>'required|string',
            'assigned'=>'required|array',
            'assigned.*'=>'required|integer|distinct',
            'targets'=>'nullable|array',
            'targets.*'=>'integer|distinct',
            'assigned_role'=>'nullable|array',
            'files'=>'nullable|array',
//            'task_items' => 'required|array',
//            'task_items.target_type_id'=>'nullable|integer|exists:target_types,id',
//            'task_items.object_type_id'=>'nullable|integer|exists:object_types,id',
//            'task_items.object_id'=>'nullable|integer|exists:objects,id',
//            'task_items.task_id'=>'nullable|integer|exists:tasks,id',
//            'task_items.country_id'=>'nullable|integer|exists:countries,id',
//            'task_items.name'=>'required|string',
//            'task_items.start'=>'required|date',
//            'task_items.deadline'=>'required|date',
//            'task_items.files'=>'nullable|array',
//            'task_items.files.*'=>'nullable|integer|distinct',
//            'task_items.definition' => 'nullable|string',

        ];
    }
}
