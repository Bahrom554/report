<?php

namespace App\Http\Requests\admin;

use App\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserCreateRequest extends FormRequest
{

    public function rules()
    {
        return [
            'name'=>'required|string|max:255',
            'username'=>'required|string|max:255|unique:users',
            'password'=>'required|confirmed|string|min:6',
            'role'=>'required|string|max:16|'.Rule::in(User::rolesList())
        ];
    }
}
