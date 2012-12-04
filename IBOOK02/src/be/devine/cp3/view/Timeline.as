/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 27/11/12
 * Time: 18:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.components.ScrollBar;
import be.devine.cp3.view.components.ScrollBarOptions;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;

public class Timeline extends Sprite{

    private var _appModel:AppModel;
    private var _background:Quad;
    private var _container:Sprite;
    private var _scrollBar:ScrollBar;

    public function Timeline() {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.BOOK_CHANGED, bookChangedHandler);
    }

    private function bookChangedHandler(event:flash.events.Event):void {
        _background =  new Quad(300,stage.stageHeight,0x31f1dd);
        _background.x = stage.stageWidth - 300;
        addChild(_background);

        _container = new Sprite();
        _container.x = stage.stageWidth - 290;
        addChild(_container);

        var hulpY:int = 10;
        for each(var pageVO:PageVO in _appModel.bookVO.pages)
        {
            var page:Quad = new Quad(270,170,0x000000);
            _container.addChild(page);
            page.y = hulpY;
            hulpY += 180;
        }

        var config:ScrollBarOptions = new ScrollBarOptions();
        config.height = stage.stageHeight;
        config.width = 10;
        config.thumbcolor = 0xaaaaaa;
        config.thumbheight = 10;
        config.trackcolor = 0x222222;


        _scrollBar = new ScrollBar(config);
        _scrollBar.x = stage.stageWidth - 10;
        _scrollBar.y = 0;
        addChild(_scrollBar);
        _scrollBar.addEventListener(ScrollBar.POSITION_UPDATED, scrollbarUpdatedHandler);
    }

    private function scrollbarUpdatedHandler(event:starling.events.Event):void {
        _container.y = _scrollBar.position * 100;
    }
}
}
