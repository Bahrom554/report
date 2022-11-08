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
            'task_id'=>'required|integer|exists:tasks,id',
            'targets'=>'required|array',
            'result_type_id'=>'required|integer|exists:result_types,id',
            'task_items'=>'required|array',
            'description'=>'required|string',
            'files'=>'nullable|array'
        ];
    }
}
