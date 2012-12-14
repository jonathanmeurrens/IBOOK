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

    public static const IMAGES_CHANGED:String = "imagesChanged";
    public static const SELECTED_INDEX_CHANGED:String = "selectedIndexChanged";

    private var _selectedImageIndex:uint=-1;
    private var _images:Vector.<ImageVO>;
    private var _isAnimationsOn:Boolean=false;
    private var _loop:Boolean=true;

    public function GalleryModel()
    {
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
            selectedImageIndex=0;
        }
    }

    public function get selectedImage():ImageVO{
        return images[_selectedImageIndex];
    }

    public function get isAnimationsOn():Boolean {
        return _isAnimationsOn;
    }

    public function set isAnimationsOn(value:Boolean):void {
        _isAnimationsOn = value;
    }

    public function set loop(value:Boolean):void
    {
        _loop = value;
    }

    public function get loop():Boolean
    {
        return _loop;
    }
}
}
