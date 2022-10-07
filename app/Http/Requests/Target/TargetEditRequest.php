<?php

namespace App\Http\Requests\Target;

use Illuminate\Foundation\Http\FormRequest;

class TargetEditRequest extends FormRequest
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
            'name'=>'string|unique:targets|max:255',
            'target_type_id'=>'nullable|integer|exists:target_types,id',
            'object_type_id'=>'nullable|integer|exists:object_types,id',
            'object_id'=>'nullable|integer|exists:objects,id',
            'parent_id'=>'nullable|integer|exists:targets,id',
            'country_id'=>'nullable|integer|exists:countries,id',
            'raw_name'=>'nullable|array',
        ];
    }
}
