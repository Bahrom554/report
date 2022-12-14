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
            'assigned_role'=>'required|array',
            'assigned.*'=>'required|integer|distinct',
            'files'=>'nullable|array',
            'definition'=>'nullable|string'


        ];
    }
}
