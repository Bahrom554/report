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
            'task_item_id'=>'nullable|integer|exists:task_items,id',
            'target_id'=>'nullable|integer|exists:targets,id',
            'result_type_id'=>'integer|exists:result_types,id',
            'description'=>'string',
            'files'=>'nullable|array'
        ];
    }
}
