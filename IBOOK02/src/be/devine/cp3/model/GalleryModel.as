/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 29/11/12
 * Time: 15:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model {
import be.devine.cp3.vo.ImageVO;

import flash.events.Event;
import flash.events.EventDispatcher;

public class GalleryModel extends EventDispatcher{

    private static var instance:GalleryModel;

    public static const IMAGES_CHANGED:String = "IMAGES_CHANGED";
    public static const SELECTED_INDEX_CHANGED:String = "SELECTED_INDEX_CHANGED";

    private var _selectedImageIndex:uint;
    private var _images:Vector.<ImageVO>;

    public static function getInstance():GalleryModel
    {
        if(instance == null) {
            instance = new GalleryModel(new Enforcer());
        }
        return instance;
    }

    public function GalleryModel(e:Enforcer)
    {
        if(e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }
    }

    public function goToPreviousImage():void
    {
        if(_selectedImageIndex-1>=0)
            selectedImageIndex--;
        else
            selectedImageIndex=_images.length-1;
    }

    public function goToNextImage():void
    {
        if(_selectedImageIndex+1<=_images.length-1)
            selectedImageIndex++;
        else
            selectedImageIndex=0;
    }

    public function get selectedImageIndex():uint
    {
        return _selectedImageIndex;
    }

    public function set selectedImageIndex(value:uint):void
    {
        if(value!=_selectedImageIndex)
        {
            _selectedImageIndex = value;
            dispatchEvent(new Event(GalleryModel.SELECTED_INDEX_CHANGED));
        }
    }

    public function get images():Vector.<ImageVO>
    {
        return _images;
    }

    public function set images(value:Vector.<ImageVO>):void
    {
        if(value!=_images)
        {
            _images = value;
            dispatchEvent(new Event(GalleryModel.IMAGES_CHANGED));
        }
    }
}
}
internal class Enforcer{};
