<?php

namespace App\UseCases;


use App\Models\ObjectM;
use App\Models\Target;
use App\Models\User;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TargetService
{
    public function create($request)

    {
        $target0 = Target::make($request->only( 'target_type_id','object_id','parent_id','name'));
        if(filter_var($request->name, FILTER_VALIDATE_URL)){
            if($target=Target::where('name',$this->get_fulldomain($request->name))->first()){
              // bor target kelganda yangi target yaralmedi shunchaki raw_name ga qo'shib qo'yiladi
                $option=$target->raw_name ? : [];
                array_push($option,$request->name);
                $target->raw_name=$option;
                $target->save();
                return $target;
            }
            elseif ($target=Target::where('name',$this->get_domain($request->name))->first()){
                   $target0->parent_id=$target->id;
            }

                $target0->name=$this->get_fulldomain($request->name);
                $option=$target0->raw_name ? : [];
                array_push($option,$request->name);
                $target0->raw_name=$option;
            }
        $object=ObjectM::findOrFail($request->object_id);
        $target0->object_type_id=$object->object_type_id ? : null;
        $target0->country_id=$object->country_id ? : null;
        $target0->user_id=Auth::user()->id;
        $target0->save();
        return $target0;
    }
    public function edit(Target $target, $request){

        if($request->has('object_id')){
            $object=ObjectM::findOrFail($request->object_id);
            $request['country_id']=$object->country_id;
            $request['object_type_id']=$object->object_type_id;
        }
        $target->update($request->only('name','target_type_id','object_id','parent_id','country_id','object_type_id'));
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
    function get_fulldomain($url) {
        $host = parse_url($url, PHP_URL_HOST);
        return preg_replace('/^www\./', '', $host);
    }
}
