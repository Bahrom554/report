<?php

namespace App\Http\Requests\TaskItem;

use Illuminate\Foundation\Http\FormRequest;

class TaskItemCreateRequest extends FormRequest
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
            'target_id'=>'required|integer|exists:targets,id',
            'object_id'=>'nullable|integer|exists:objects,id',
            'task_id'=>'nullable|integer|exists:tasks,id',
            'country_id'=>'nullable|integer|exists:countries,id',
            'start'=>'required|date',
            'deadline'=>'required|date',
            'files'=>'nullable|array',
            'files.*'=>'nullable|integer|distinct',
            'definition' => 'nullable|string',
        ];
    }
}
