/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 29/11/12
 * Time: 14:35
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.gallery {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.model.GalleryModel;
import be.devine.cp3.util.queue.Queue;
import be.devine.cp3.util.queue.tasks.LoaderTask;
import be.devine.cp3.vo.ImageVO;

import flash.display.Bitmap;

import flash.events.Event;

import starling.display.Image;
import starling.display.Quad;

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
            var thumbnail:Sprite = new Sprite();
            var image:Image = new Image(Texture.fromBitmap(imageTask.content as Bitmap));
            image.scaleX  = image.scaleY = 0.07;
            thumbnail.addChild(image);
            thumbnail.x = xPos;

            var imageBorder:Quad = new Quad(image.width+6, image.height+6,AppModel.getInstance().bookVO.themeColor);
            thumbnail.addChild(imageBorder);
            thumbnail.setChildIndex(imageBorder,0);
            imageBorder.x -=3;
            imageBorder.y -=3;

            thumbnail.addEventListener(TouchEvent.TOUCH, thumbTouchHandler);
            xPos+=thumbnail.width+10;

            addChild(thumbnail);
        }
    }

    private function thumbTouchHandler():void
    {

    }
}
}
