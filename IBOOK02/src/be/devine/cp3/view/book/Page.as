/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 26/11/12
 * Time: 17:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.book
{

import be.devine.cp3.view.book.components.buttons.Link;
import be.devine.cp3.view.book.components.gallery.Gallery;
import be.devine.cp3.view.book.components.text.Body;
import be.devine.cp3.view.book.components.text.Title;
import be.devine.cp3.vo.PageVO;

import flash.geom.Point;
import flash.geom.Rectangle;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.RenderSupport;
import starling.core.Starling;
import starling.display.Quad;
import starling.display.Sprite;

public class Page extends Sprite
    {
        private var _pageVO:PageVO;

        private var _title:Title;
        private var _body:Body;
        private var _gallery:Gallery;
        private var _link:Link;

        private var _foregroundContainer:Sprite;
        private var _foregroundContainerIniX:int;

        private var _isAnimationsOn:Boolean=false;
        private var _background:Quad;
        private var _tween:Tween;

        public function Page(pageVO:PageVO)
        {
            _pageVO = pageVO;
            _foregroundContainer = new Sprite();
            _background = new Quad(Starling.current.stage.width, Starling.current.stage.height,0x00000);
            addChild(_background);

            if(_pageVO.galleryVO.images.length>0){
                _gallery = new Gallery(_pageVO.galleryVO);
                addChild(_gallery);
            }

            if(_pageVO.titleVO.title!=""){
                _title = new Title(_pageVO.titleVO);
                _foregroundContainer.addChild(_title);
            }

            if(_pageVO.bodyVO.body!=''){
                _body = new Body(_pageVO.bodyVO);
                _foregroundContainer.addChild(_body);
            }

            if(_pageVO.linkVO.label!=""){
                _link = new Link(_pageVO.linkVO);
                _foregroundContainer.addChild(_link);
            }

            addChild(_foregroundContainer);
            _foregroundContainerIniX = _foregroundContainer.x;
        }

        /*
        ANIMATION CONTROLS, is this the current page? then play the slideshow
         */

        public function toggleAnimations():void
        {
            _isAnimationsOn = !_isAnimationsOn;
            if(_gallery!=null)
                _gallery.toggleAnimations(_isAnimationsOn);
        }

        /*
         TWEENING, parallax effect
         */

        public function transitionIn():void
        {
            _foregroundContainer.x=_foregroundContainerIniX+200;
            _tween = new Tween(_foregroundContainer, 2, Transitions.EASE_IN_OUT);
            _tween.animate("x",_foregroundContainerIniX);
            Starling.juggler.add(_tween);
        }

        public function transitionOut():void
        {
            _tween = new Tween(_foregroundContainer, 1.5, Transitions.EASE_IN_OUT);
            _tween.animate("x",_foregroundContainerIniX-200);
            _tween.onComplete = function():void{
                _foregroundContainer.x=_foregroundContainerIniX;
            }
            Starling.juggler.add(_tween);
        }


        /*
        RENDER MASK, to prevent pages to overflow into one another
         */
        public override function render(support:RenderSupport, alpha:Number):void
        {
            support.finishQuadBatch();
            Starling.context.setScissorRectangle(new Rectangle(localToGlobal(new Point(0, 0)).x,localToGlobal(new Point(0, 0)).y,Starling.current.stage.stageWidth,Starling.current.stage.stageWidth));
            super.render(support, alpha);
            support.finishQuadBatch();
            Starling.context.setScissorRectangle(null);
        }
    }
}
