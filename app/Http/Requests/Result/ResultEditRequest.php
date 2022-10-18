<?php

namespace App\Http\Requests\Result;

use Illuminate\Foundation\Http\FormRequest;

class ResultEditRequest extends FormRequest
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
            'task_id'=>'integer|exist:tasks,id',
            'target_id'=>'integer|exist:targets,id',
            'result_type_id'=>'integer|exist:result_types,id',
            'task_item'=>'array',
            'description'=>'string',
            'files'=>'nullable|array'
        ];
    }
}
