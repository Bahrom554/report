<?php

namespace App\Http\Controllers;

use App\ImageUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;


class ImageUploadController extends Controller
{
    public function store(Request $request){

        if(! is_dir(public_path('/images'))){
            mkdir(public_path('/images'),0777);
        }
        $images=Collection::wrap($request->file('file'));
        $images->each(function ($image){
            $basename=Str::random();
            $original=$basename.'.'.$image->getClientOriginalExtension();
            $thumbnail=$basename.'_thumb.'.$image->getClientOriginalExtension();
            Image::make($image)->fit(width:250,height:250)->save(public_path('/images'.$thumbnail));
            $image->move(public_path('/images'),$original);
            ImageUpload::create([
                'original'=>'/images/'.$original,
                 'thumbnail'=>'/image/'.$thumbnail
            ]);
        });

    }
    public function delete(ImageUpload $image){
      File::delete([
       public_path($image->original),
          public_path($image->thumbnail)

      ]);

    }

}
