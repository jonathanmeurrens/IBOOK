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
                page.x = xPos;
                addChild(page);
                xPos+=stage.stageWidth;
                _pages.push(page);
            }
            _pages[0].toggleAnimations();
        }

        private function pageChangedHandler(e:Event):void
        {
            var currentPage:Page = _pages[_appModel.currentPageIndex];
            currentPage.visible=true;
            currentPage.toggleAnimations();
            if(_appModel.currentPageIndex>0)
            {
                var prevPage:Page = _pages[_appModel.currentPageIndex-1];
                Page(prevPage.transitionOut());
                prevPage.toggleAnimations();
            }
            Page(currentPage.transitionIn());

            // beweeg gans het book zodat de juiste pagina zichtbaar wordt => pageIndex*stage.stageWidth
            var tween:Tween = new Tween(this, 2, Transitions.EASE_IN_OUT);
            tween.animate("x",-(_appModel.currentPageIndex)*stage.stageWidth);
            Starling.juggler.add(tween);
        }

        /*public override function render(support:RenderSupport, alpha:Number):void
        {
            support.finishQuadBatch();
            Starling.context.setScissorRectangle(new Rectangle(localToGlobal(new Point(0, 0)).x,localToGlobal(new Point(0, 0)).y,Starling.current.stage.stageWidth,Starling.current.stage.stageWidth));
            super.render(support, alpha);
            support.finishQuadBatch();
            Starling.context.setScissorRectangle(null);
        }*/
    }
}
