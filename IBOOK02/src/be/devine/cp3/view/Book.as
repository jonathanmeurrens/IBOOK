/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 26/11/12
 * Time: 17:29
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Sprite;

public class Book extends Sprite
    {
        private var _appModel:AppModel;

        public function Book()
        {
            _appModel = AppModel.getInstance();
            _appModel.addEventListener(AppModel.BOOK_CHANGED, pagesBookChangedHandler);
        }

        private function pagesBookChangedHandler(e:Event):void
        {
            for each(var pageVO:PageVO in _appModel.bookVO.pages)
            {
                //trace(pageVO.title);
                var page:Page = new Page(pageVO);
                addChild(page);
                break;
            }
            //Page uittweenen (hoort in een aparte function)
            /*page.tweenOut();
            var tween:Tween = new Tween(page, 2, Transitions.EASE_IN);
            tween.animate("x",-1400);
            tween.delay = 1;
            Starling.juggler.add(tween);*/
        }
    }
}
