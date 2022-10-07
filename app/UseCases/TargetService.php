<?php

namespace App\UseCases;


use App\Models\Target;
use Illuminate\Http\Request;

class TargetService
{
    public function create($request)

    {
        if(filter_var($request->name, FILTER_VALIDATE_URL) && $target=Target::where('name',$this->get_domain($request->name))->first()){
            $option=$target->raw_name ? : [];
            array_push($option,$request->name);
            $target->raw_name=$option;
            $target->save();
            return $target;
    }
        $target = Target::make($request->only( 'target_type_id','object_type_id','object_id','parent_id','country_id','name'));
        if(filter_var($request->name, FILTER_VALIDATE_URL)){
            $target->name=$this->get_domain($request->name);
            $option=$target->raw_name ? : [];
            array_push($option,$request->name);
            $target->raw_name=$option;
        }
        $target->save();
        return $target;
    }
    public function edit($id, $request){
        $target = $this->getTarget($id);
        $target->update($request->only('name', 'target_type_id','object_type_id','object_id','parent_id','country_id'));
        return $target;
    }
    public function remove($id)
    {
        $target = $this->getTarget($id);
        $target->delete();
    }
    private function getTarget($id):Target
    {
        return Target::findOrFail($id);
    }

   public function get_domain($url)
    {
        preg_match("/[a-z0-9\-]{1,63}\.[a-z\.]{2,6}$/", parse_url($url, PHP_URL_HOST), $_domain_tld);
        return $_domain_tld[0];
    }
}
