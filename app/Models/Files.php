<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Helpers\FilemanagerHelper;

class Files extends Model
{
    protected $table = 'files';

    protected $fillable = [
        'title',
        'description',
        'slug',
        'ext',
        'file',
        'folder',
        'domain',
        'user_id',
        'path',
        'size',
        'folder_id'
    ];

//    protected $appends = [
//        'thumbnails'
//    ];
    /**
     * @var mixed
     */


    /**
     * @return bool
     */
    public function getIsImage()
    {
        return in_array($this->ext,FileManagerHelper::getImagesExt());


    }

    /**
     * @return string
     */
    public function getDist()
    {
        return $this->folder.'/'. $this->file;
    }

    public function getUserAttribute()
    {
        return $this->hasOne('App\Models\User');
    }

    /**
     * @return mixed
     */
//    public function getThumbnailsAttribute()
//    {
//        $thumbsImages = FileManagerHelper::getThumbsImage();
//        if(!$this->getIsImage()){
//            $thumbsImage['src']=config('system.STATIC_URL').$this->folder.$this->slug . "." . $this->ext;
//            $thumbsImage['path'] = $this->path . $this->slug . "." . $this->ext;
//            return $thumbsImage;
//        }
//        foreach ($thumbsImages as &$thumbsImage) {
//            $slug = $thumbsImage['slug'];
//            $newFileDist = config('system.STATIC_URL').$this->folder.$this->slug . "_".$slug . "." . $this->ext;
//            $thumbsImage['src'] = $newFileDist;
//            $thumbsImage['path'] = $this->path . $this->slug . "_".$slug . "." . $this->ext;
//        }
//        return $thumbsImages;
//    }
}
