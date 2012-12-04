/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 26/11/12
 * Time: 17:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{

import be.devine.cp3.factory.view.ComponentViewFactory;
import be.devine.cp3.view.components.buttons.NextPageBtn;
import be.devine.cp3.view.gallery.Gallery;
import be.devine.cp3.vo.ComponentVO;
import be.devine.cp3.vo.PageVO;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Button;
import starling.display.DisplayObject;

import starling.display.Sprite;

public class Page extends Sprite
    {
        private var _pageVO:PageVO;
        private var _foregroundContainer:Sprite;
        private var _components:Vector.<DisplayObject>;

        public function Page(pageVO:PageVO)
        {
            _pageVO = pageVO;
            _foregroundContainer = new Sprite();
            _components = new Vector.<DisplayObject>();
            for each(var componentVO:ComponentVO in _pageVO._components)
            {
                var component:DisplayObject = ComponentViewFactory.createFromVO(componentVO);
                _components.push(component);
                if(component is Gallery)
                    addChild(component);
                else
                    _foregroundContainer.addChild(component);
                addChild(_foregroundContainer);
            }
        }

    /*
     TWEENING
     */

    /*private function tweenBackground():void
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
    }*/

    public function setAsThumbnail():void{
        for each(var object:DisplayObject in _components)
        {
            if(object is Button)
            {
                object.alpha = 0;
            }
        }
    }

    public function transitionIn():void
    {
        _foregroundContainer.x+=200;
        var tween:Tween = new Tween(_foregroundContainer, 2, Transitions.EASE_IN_OUT);
        tween.animate("x",_foregroundContainer.x-200);
        Starling.juggler.add(tween);
    }

    public function transitionOut():void
    {
        var tween:Tween = new Tween(_foregroundContainer, 1.5, Transitions.EASE_IN_OUT);
        tween.animate("x",_foregroundContainer.x-200);
        tween.onComplete = function():void{
            _foregroundContainer.x+=200;
        }
        Starling.juggler.add(tween);
    }

    public function tweenOut():void
    {
        /*trace('[PAGE] TweeningOut');
        var textTween:Tween = new Tween(_bodyTXT, 2, Transitions.EASE_IN);
        textTween.animate("x", -_bodyTXT.width);
        Starling.juggler.add(textTween);
        var bodyTween:Tween = new Tween(_bodyBackgroundImage, 2, Transitions.EASE_IN);
        bodyTween.animate("x", -_bodyBackgroundImage.width);
        Starling.juggler.add(bodyTween);*/
    }
    }
}
