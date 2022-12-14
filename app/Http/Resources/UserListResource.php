<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserListResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
             'id'=>$this->id,
            'name' => $this->name,
            'username' => $this->username,
            'avatar'=>$this->avatar,
            'created_at' => $this->created_at,
            'roles'=>$this->roles
        ];
    }
}
