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
            'task_id'=>'nullable|integer|exists:tasks,id',
            'user_id'=>'nullable|integer|exists:users,id',
            'start'=>'required|date',
            'deadline'=>'required|date',
            'files'=>'nullable|array',
            'files.*'=>'nullable|integer|distinct',
            'definition' => 'nullable|string',
        ];
    }
}
