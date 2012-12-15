/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 14:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.book.components.gallery {
import be.devine.cp3.model.GalleryModel;
import be.devine.cp3.util.queue.Queue;
import be.devine.cp3.util.queue.tasks.LoaderTask;

import flash.display.Bitmap;
import flash.events.Event;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class Picture extends Sprite
{
    private var _loadingQueue:Queue;
    private var _imageTask:LoaderTask;
    private var _galleryModel:GalleryModel;
    private var _image:Image;

    public function Picture(galleryModel:GalleryModel)
    {
        _galleryModel = galleryModel;
        _galleryModel.addEventListener(GalleryModel.SELECTED_INDEX_CHANGED, selectedIndexChanged);

        _loadingQueue = new Queue();
    }

    private function selectedIndexChanged(e:Event):void
    {
        _imageTask = new LoaderTask(_galleryModel.selectedImage.url);
        _loadingQueue.add(_imageTask);
        _imageTask.addEventListener(Event.COMPLETE,onComplete);
        _loadingQueue.start();
    }

    protected function onComplete(event:Event):void
    {
        if(_image!=null)
        {
            var tween:Tween = new Tween(_image, 0.5);
            tween.fadeTo(0);
            tween.onComplete=showImage;
            Starling.juggler.add(tween);
        }
        else
            showImage();
    }

    private function showImage()
    {
        if(_image!=null)
        {
            removeChild(_image);
            _image.dispose();
            _image = null;
        }

        _image = new Image(Texture.fromBitmap(_imageTask.content as Bitmap));
        addChild(_image);
        if(_galleryModel.isAnimationsOn)
        {
            _image.alpha=0;
            var tween:Tween = new Tween(_image, 0.5);
            tween.fadeTo(1);
            Starling.juggler.add(tween);
        }
    }

}
}
