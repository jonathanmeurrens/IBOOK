/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 14/12/12
 * Time: 08:46
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.util.queue.Queue;
import be.devine.cp3.util.queue.tasks.LoaderTask;
import be.devine.cp3.vo.ImageVO;
import be.devine.cp3.vo.PageVO;

import flash.display.Bitmap;
import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;

import starling.animation.Tween;
import starling.core.RenderSupport;
import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class TimelineThumbnail extends Sprite
{
    private var _pageVO:PageVO;
    private var _queue:Queue;
    private var _thumbTask:LoaderTask;
    private var _title:Sprite;

    private var _width:uint=100;
    private var _height:uint=80;

    public function TimelineThumbnail(pageVO:PageVO)
    {
        _pageVO = pageVO;
        _queue = new Queue();

        _thumbTask = new LoaderTask(ImageVO(_pageVO.galleryVO.images[0]).url);
        _queue.add(_thumbTask);
        _thumbTask.addEventListener(Event.COMPLETE,onComplete);
        _queue.start();


    }

    private function onComplete(e:Event):void
    {
        var image:Image = new Image(Texture.fromBitmap(_thumbTask.content as Bitmap));
        addChild(image);

        var xProp:Number = 150/image.width;
        image.width *=xProp;
        image.height *=xProp;

        if(_pageVO.titleVO.title!=""){
            _title = TextFieldFactory.createTitleLabel(_pageVO.titleVO.title,_width);
            //_title.alpha=0;
            _title.alpha=0.6;
            addChild(_title);
            //addEventListener(TouchEvent.TOUCH,thumbTouch);
        }
    }

    public override function render(support:RenderSupport, alpha:Number):void
    {
        support.finishQuadBatch();
        Starling.context.setScissorRectangle(new Rectangle(localToGlobal(new Point(0, 0)).x,localToGlobal(new Point(0, 0)).y,_width,_height));
        super.render(support, alpha);
        support.finishQuadBatch();
        Starling.context.setScissorRectangle(null);
    }

    private function thumbTouch(event:TouchEvent):void {
        var touch:Touch = event.getTouch(stage);
        if(touch.phase == TouchPhase.HOVER)
        {
            // show title label
            var tween:Tween = new Tween(_title,0.3);
            tween.fadeTo(1);
            tween.onComplete=function(){
                var tween:Tween = new Tween(_title,0.3);
                tween.fadeTo(0);
                tween.delay=1.5;
                Starling.juggler.add(tween);
            }
            Starling.juggler.add(tween);
        }
    }


    override public function get width():Number {
        return _width;
    }

    override public function get height():Number {
        return _height;
    }
}
}
