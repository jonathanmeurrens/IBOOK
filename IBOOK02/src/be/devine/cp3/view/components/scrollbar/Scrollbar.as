/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 2/10/12
 * Time: 13:51
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.scrollbar {
import be.devine.cp3.view.components.*;
import be.devine.cp3.view.components.scrollbar.ScrollBarOptions;

import flash.geom.Point;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

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
    private var _automaticScroll:Boolean=true;
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
        _thumb.alpha = 0.6;
        addChild(_thumb);
    }


    public function get position():Number {
        return _position;
    }

    public function set position(value:Number):void {
        trace("[ScrollBar] position value: "+value);
        if(_position != value)
        {
            if(value<=1 && value>=0)
                _position = value;
            else
                _position=0;
            trace("[ScrollBar] position: "+position);
            dispatchEvent(new Event(POSITION_UPDATED));

            if(_automaticScroll)
            {
                updateThumbPosition();
            }
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
            else if(position.y + target.height > stage.stageHeight)
            {
                target.y = stage.stageHeight - target.height;
            }
            else
            {
                target.y = position.y - target.height/2;
            }
            _automaticScroll=false;
            updatePosition();
        }
    }

    private function updatePosition():void
    {
        position = _thumb.y / (_config.height-_config.thumbheight);
        _automaticScroll=true;
    }

    private function updateThumbPosition():void{
        var tween:Tween = new Tween(_thumb,0.2,Transitions.LINEAR);
        tween.animate('y',_position * (_config.height-_config.thumbheight));
        Starling.juggler.add(tween);
    }
}
}
