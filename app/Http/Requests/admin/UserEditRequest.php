<?php

namespace App\Http\Requests\admin;

use App\Models\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserEditRequest extends FormRequest
{


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
            'coordination'=>'array',
            'coordination.*'=>'string|distinct|min:3',
            'phone'=>'array',
            'mails'=>'array',
            'description'=>'string'
        ];
    }
}
