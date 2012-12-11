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
import be.devine.cp3.view.components.gallery.Gallery;
import be.devine.cp3.vo.ComponentVO;
import be.devine.cp3.vo.PageVO;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Button;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Page extends Sprite
    {
        private var _pageVO:PageVO;
        private var _components:Vector.<DisplayObject>;

        private var _foregroundContainer:Sprite;
        private var _isAnimationsOn:Boolean=false;
        private var _background:Quad;

        public function Page(pageVO:PageVO)
        {
            _pageVO = pageVO;
            _foregroundContainer = new Sprite();
            _background = new Quad(Starling.current.stage.width, Starling.current.stage.height,0x00000);
            addChild(_background);

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

        public function setAsThumbnail():void
        {
            for each(var object:DisplayObject in _components)
            {
                if(object is Button)
                {
                    object.visible=false;
                }
            }
        }

        /*
        ANIMATION CONTROLS
         */

        public function toggleAnimations():void
        {
            for each(var object:DisplayObject in _components)
            {
                if(object is Gallery)
                {
                    _isAnimationsOn = !_isAnimationsOn;
                    Gallery(object).toggleAnimations(_isAnimationsOn);
                }
            }
        }

        /*
         TWEENING
         */

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
    }
}
