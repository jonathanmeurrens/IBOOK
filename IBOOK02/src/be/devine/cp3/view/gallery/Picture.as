/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 14:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.gallery {
import be.devine.cp3.util.queue.Queue;
import be.devine.cp3.util.queue.tasks.LoaderTask;

import flash.display.Bitmap;
import flash.events.Event;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class Picture extends Sprite
{
    private var _loadingQueue:Queue;
    private var _imageTask:LoaderTask;

    public function Picture(url:String)
    {
        _loadingQueue = new Queue();
        _imageTask = new LoaderTask(url);
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
