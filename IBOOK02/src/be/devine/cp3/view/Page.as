/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 26/11/12
 * Time: 17:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import be.devine.cp3.view.components.Picture;
import be.devine.cp3.vo.PageVO;

import flash.display.BitmapData;

import flash.display.Shape;
import flash.filters.DropShadowFilter;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Image;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Page extends Sprite
    {
        private var _pageVO:PageVO;
        private var _background:Picture;
        private var _bodyTXT:TextField;
        private var _bodyBackground:Shape;

        public function Page(pageVO:PageVO)
        {
            trace('[PAGE] construct');
            _pageVO = pageVO;

            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            _background = new Picture(_pageVO.background_image);
            addChild(_background);
            tweenBackground();

            _bodyTXT = new TextField(450,stage.stageHeight-20,_pageVO.body,"Arial",14);
            trace(stage.stageHeight);
            _bodyTXT.x = 20;
            _bodyTXT.hAlign=HAlign.LEFT;
            _bodyTXT.vAlign=VAlign.BOTTOM;
            addChild(_bodyTXT);

            _bodyBackground = new Shape();
            _bodyBackground.graphics.beginFill(0xFFFFFF);
            _bodyBackground.graphics.drawRect(0,0,_bodyTXT.width+_bodyTXT.x+20,stage.stageHeight);
            _bodyBackground.graphics.endFill();
            _bodyBackground.filters = [ new DropShadowFilter(4, 45, 0x000000, 0.3, 17, 17, 2, 3) ];

            var bmpData:BitmapData = new BitmapData(_bodyBackground.width+20, _bodyBackground.height, true, 0x0);
            bmpData.draw(_bodyBackground);
            var texture:Texture = Texture.fromBitmapData(bmpData);
            var image:Image = new Image(texture);
            addChild(image);

            setChildIndex(image,getChildIndex(_background)+1);
        }
    private function tweenBackground():void
    {
        if(_background.x == 0)
        {
            //tweenen naar rechts
            var t:Tween = new Tween(_background, 60, Transitions.EASE_IN_OUT);
            t.animate("x", 200);
            t.onComplete = tweenBackground;
            Starling.juggler.add(t);
        }
        else
        {
            // tweenen naar links
            var t:Tween = new Tween(_background, 60, Transitions.EASE_IN_OUT);
            t.animate("x", 0);
            t.onComplete = tweenBackground;
            Starling.juggler.add(t);
        }
    }

    public function tweenOut():void
    {
        trace('[PAGE] TweeningOut');
        var textTween:Tween = new Tween(_bodyTXT, 2, Transitions.EASE_IN);
        textTween.animate("x", -_bodyTXT.width);
        Starling.juggler.add(textTween);
        var bodyTween:Tween = new Tween(_bodyBackground, 2, Transitions.EASE_IN);
        bodyTween.animate("x", -_bodyBackground.width);
        Starling.juggler.add(bodyTween);
    }
    }
}
