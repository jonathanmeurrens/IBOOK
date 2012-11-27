/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 14:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components {
import be.devine.cp3.util.queue.ImageTask;
import be.devine.cp3.util.queue.QueueLoader;

import flash.display.Bitmap;
import flash.events.Event;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class Picture extends Sprite
{
    private var _loadingQueue:QueueLoader;
    private var _imageTask:ImageTask;

    public function Picture(url:String)
    {
        _loadingQueue = new QueueLoader();
        _imageTask = new ImageTask(url);
        _loadingQueue.add(_imageTask);
        _imageTask.addEventListener(Event.COMPLETE,onComplete);
        _loadingQueue.start();
    }

    protected function onComplete(event:Event):void
    {
        var image:Image = new Image(Texture.fromBitmap(_imageTask.content as Bitmap));
        addChild(image);
    }

}
}
