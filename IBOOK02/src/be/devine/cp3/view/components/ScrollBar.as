/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 2/10/12
 * Time: 13:51
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components {
import flash.geom.Point;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ScrollBar extends Sprite{
    private var _config:ScrollBarOptions;
    private var _track:Quad;

    private var _thumb:Quad;

    private var _position:Number;

    public static const POSITION_UPDATED:String = 'POSITION_UPDATED';

    public function ScrollBar(config:ScrollBarOptions) {
        _config = config;
        this.createTrack();
        this.createThumb();
        _thumb.addEventListener(TouchEvent.TOUCH, onTouch);
    }


    private function createTrack():void{
        _track = new Quad(_config.width,_config.height,_config.trackcolor);
        addChild(_track);
    }
    private function createThumb():void{
        _thumb = new Quad(_config.width,_config.thumbheight,_config.thumbcolor);
        addChild(_thumb);
    }


    public function get position():Number {
        return _position;
    }

    public function set position(value:Number):void {
        if(_position != value)
        {
            _position = value;

            dispatchEvent(new Event(POSITION_UPDATED));
        }
    }

    private function onTouch(event:TouchEvent):void {
        var touch:Touch = event.getTouch(stage);
        var position:Point = touch.getLocation(stage);
        var target:Quad = event.target as Quad;

        if(touch.phase == TouchPhase.MOVED ){
            if(position.y - target.height/2 < 0)
            {
                target.y = 0;
            }
            else if(position.y - target.height/2 > stage.stageHeight)
            {
                target.y = stage.stageHeight - target.height;
            }
            else
            {
                target.y = position.y - target.height/2;
            }
            updatePosition();
        }
    }

    private function updatePosition():void
    {
        position = _thumb.y / (_config.height-_config.thumbheight);
    }
}
}
