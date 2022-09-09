<?php

namespace App\Http\Requests\admin;

use App\User;
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
            'username'=>'string|max:255|unique:users',
            'role'=>'string|max:16|'.Rule::in(User::rolesList())
        ];
    }
}
