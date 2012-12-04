/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 29/11/12
 * Time: 14:35
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.gallery {
import be.devine.cp3.model.GalleryModel;
import be.devine.cp3.util.queue.Queue;
import be.devine.cp3.util.queue.tasks.LoaderTask;
import be.devine.cp3.vo.ImageVO;

import flash.display.Bitmap;

import flash.events.Event;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.textures.Texture;

public class Thumbnails extends Sprite
{
    private var _queue:Queue;

    public function Thumbnails(images:Vector.<ImageVO>)
    {
        _queue = new Queue()

       for each(var image:ImageVO in images)
       {
            _queue.add(new LoaderTask(image.url));
       }
        _queue.addEventListener(Event.COMPLETE, queueCompleteHandler);
        _queue.start();
    }

    private function queueCompleteHandler(e:Event):void
    {
        var xPos:uint = 0;
        var yPos:uint = 0;
        for each(var imageTask:LoaderTask in _queue.finishedTasks)
        {
            var image:Image = new Image(Texture.fromBitmap(imageTask.content as Bitmap));
            addChild(image);
            image.x = xPos;
            image.scaleX  = image.scaleY = 0.1;
            image.addEventListener(TouchEvent.TOUCH, thumbTouchHandler);
            xPos+=image.width+10;
        }
    }

    private function thumbTouchHandler():void
    {

    }
}
}
