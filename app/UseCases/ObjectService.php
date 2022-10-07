<?php

namespace App\UseCases;


use App\Models\Object;
use Illuminate\Http\Request;

class ObjectService
{
    public function create($request)
    {
        $object = Object::make($request->only('country_id', 'code', 'object_type_id', 'name', 'address', 'coordination', 'phone', 'mails', 'description'));
        $object->save();
        return $object;
    }
    public function edit($id, $request){
        $object = $this->getObject($id);
        $object->update($request->only('country_id', 'code', 'object_type_id', 'name', 'address', 'coordination', 'phone', 'mails', 'description'));
        return $object;
    }
    public function remove($id)
    {
        $object = $this->getObject($id);

        $object->delete();
    }
    private function getObject($id):Object
    {
        return Object::findOrFail($id);
    }

}