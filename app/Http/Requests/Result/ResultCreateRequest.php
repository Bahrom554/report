<?php

namespace App\Http\Requests\Result;

use Illuminate\Foundation\Http\FormRequest;

class ResultCreateRequest extends FormRequest
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
            'task_id'=>'required|integer|exist:tasks,id',
            'target_id'=>'required|integer|exist:targets,id',
            'result_type_id'=>'required|integer|exist:result_types,id',
            'task_item'=>'required|array',
            'description'=>'required|string',
            'files'=>'nullable|array'
        ];
    }
}
