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

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Quad;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Page extends Sprite
    {
        private var _pageVO:PageVO;
        private var _background:Picture;
        private var _bodyTXT:TextField;
        private var _bodyBackground:Quad;

        public function Page(pageVO:PageVO)
        {
            trace('[PAGE] construct');
            _pageVO = pageVO;

            _background = new Picture(_pageVO.background_image);
            trace("[Page] "+_pageVO.background_image);
            addChild(_background);
            tweenBackground();

            _bodyTXT = new TextField(200,1000,_pageVO.body,"Arial",14);
            _bodyTXT.hAlign=HAlign.LEFT;
            _bodyTXT.vAlign=VAlign.BOTTOM;
            addChild(_bodyTXT);

            _bodyBackground = new Quad(_bodyTXT.width,_bodyTXT.height);
            addChild(_bodyBackground);
            setChildIndex(_bodyBackground,getChildIndex(_background)+1);
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
