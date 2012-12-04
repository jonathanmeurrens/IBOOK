/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 05/11/12
 * Time: 10:42
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.scrollbar
{
import be.devine.cp3.model.AppModel;

import flash.display.Shape;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

import starling.display.DisplayObject;
import starling.display.Quad;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Scrollbar extends Sprite
{
    private var _appModel:AppModel;

    private var _bounds:Rectangle;
    private var _thumb:Quad;
    private var _track:Quad;
    private var _startY:uint=0;


    public function Scrollbar()
    {
        _appModel = AppModel.getInstance();
        display();
    }


    private function display()
    {
        _track = new Quad(25,250,0x222222);
       /* _track.graphics.beginFill(0x222222);
        _track.graphics.drawRect(0,0,25,250);
        _track.graphics.endFill();*/
        addChild(_track);

        _thumb = new Quad(20, 90, 0x999999);
        /*_thumb.graphics.beginFill(0x999999);
        _thumb.graphics.drawRect(0,0,20,90);
        _thumb.graphics.endFill();*/
        addChild(_thumb);
        _thumb.addEventListener(TouchEvent.TOUCH, thumbTouchedHandler);
        _bounds = new Rectangle(0,0,0,_track.height-_thumb.height);
    }

    private function thumbTouchedHandler(e:TouchEvent):void
    {
        var touch:Touch = e.getTouch(e.currentTarget as DisplayObject);

        if(touch!=null)
        {
            switch(touch.phase)
            {
                case TouchPhase.BEGAN:
                        trace("BEGAN",touch.getLocation(this));
                        _startY = touch.getLocation(this).y;
                    break;
                case TouchPhase.MOVED:
                        var newYPos:int = touch.getLocation(this).y-_startY;
                        trace("MOVED",touch.getLocation(this).y,newYPos,_startY);
                        if(newYPos>=0 && newYPos<=_track.height-_thumb.height)
                            _thumb.y = newYPos;
                    break;
                case TouchPhase.ENDED:
                        trace("ENDED");
                    break;
            }
        }
    }

    /*private function thumbMouseDownHandler(e:MouseEvent):void
    {
        e.target.startDrag(false,_bounds);

        _thumb.removeEventListener(MouseEvent.MOUSE_DOWN, thumbMouseDownHandler);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        stage.addEventListener(MouseEvent.MOUSE_UP, thumbMouseUpHandler);
    }

    private function mouseMoveHandler(e:MouseEvent):void
    {
        _appModel.bodyScrollPosition = _thumb.y/(_track.height-_thumb.height);
    }

    private function thumbMouseUpHandler(e:MouseEvent):void
    {
        //_thumb.stopDrag();
        stage.removeEventListener(MouseEvent.MOUSE_UP, thumbMouseUpHandler);
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        _thumb.addEventListener(MouseEvent.MOUSE_DOWN, thumbMouseDownHandler);
    }*/
}
}
