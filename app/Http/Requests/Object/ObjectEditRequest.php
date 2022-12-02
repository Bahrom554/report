<?php

namespace App\Http\Requests\Object;

use Illuminate\Foundation\Http\FormRequest;

class ObjectEditRequest extends FormRequest
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
            'name'=>'string|max:255',
            'country_id'=>'nullable|integer|exists:countries,id',
            'code'=>'nullable|string|max:512',
            'object_type_id'=>'nullable|integer|exists:object_types,id',
            'address'=>'nullable|string',
            'coordination'=>'nullable|array',
            'phone'=>'nullable|array',
            'mails'=>'nullable|array',
            'description'=>'nullable|string'
        ];
    }
}
