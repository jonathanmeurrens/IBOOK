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
        private var _pages:Vector.<Page>;

        public function Book()
        {
            _appModel = AppModel.getInstance();
            _appModel.addEventListener(AppModel.BOOK_CHANGED, bookChangedHandler);
            _appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, pageChangedHandler);
        }

        private function bookChangedHandler(e:Event):void
        {
            _pages = new Vector.<Page>();
            var xPos:uint = 0;
            for each(var pageVO:PageVO in _appModel.bookVO.pages)
            {
                var page:Page = new Page(pageVO);
                addChild(page);
                page.x = xPos;
                xPos+=stage.stageWidth;
                _pages.push(page);
            }
        }

        private function pageChangedHandler(e:Event):void
        {
            if(_appModel.currentPageIndex>0)
                Page(_pages[_appModel.currentPageIndex-1]).transitionOut();
            Page(_pages[_appModel.currentPageIndex]).transitionIn();

            var tween:Tween = new Tween(this, 2, Transitions.EASE_IN_OUT);
            tween.animate("x",-(_appModel.currentPageIndex)*stage.stageWidth);
            Starling.juggler.add(tween);
        }
    }
}
