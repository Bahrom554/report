<?php

namespace App\Http\Requests\Task;

use Illuminate\Foundation\Http\FormRequest;

class TaskEditRequest extends FormRequest
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
            'start'=>'date',
            'deadline'=>'date',
            'name'=>'string',
            'creator'=>'integer|exists:users,id',
            'assigned'=>'array',
            'assigned.*'=>'integer|distinct',
            'assigned_role'=>'array',
            'assigned_role.*'=>'integer|distinct',
            'files'=>'array',
            'files.*'=>'integer|distinct',
        ];
    }
}
