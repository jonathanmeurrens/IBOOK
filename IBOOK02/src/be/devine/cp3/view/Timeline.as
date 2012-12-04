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
import be.devine.cp3.view.components.buttons.CurrentPageButton;
import be.devine.cp3.view.components.text.MyTextField;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;

public class Timeline extends Sprite{

    private var _appModel:AppModel;
    private var _background:Quad;
    private var _container:Sprite;
    private var _scrollBar:ScrollBar;
    private var _timelineBTN:CurrentPageButton;
    private var _pages:Vector.<Page>;

    public function Timeline() {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.BOOK_CHANGED, bookChangedHandler);
    }

    private function bookChangedHandler(event:flash.events.Event):void {
        _background =  new Quad(148,stage.stageHeight,_appModel.bookVO.themeColor);
        _background.x = stage.stageWidth - 148;
        addChild(_background);

        _container = new Sprite();
        _container.x = stage.stageWidth - 142;
        addChild(_container);

        _pages = new Vector.<Page>();
        var hulpY:int = 10;
        for each(var pageVO:PageVO in _appModel.bookVO.pages)
        {
            var page:Page = new Page(pageVO);
            _container.addChild(page);
            page.width = page.width * 0.1;
            page.height = page.height * 0.1;
            page.y = hulpY;
            hulpY += page.height + 30;
            _pages.push(page);
        }

        var config:ScrollBarOptions = new ScrollBarOptions();
        config.height = stage.stageHeight;
        config.width = 7;
        config.thumbcolor = 0x444444;
        config.thumbheight = 40;
        config.trackcolor = _appModel.bookVO.themeColor;


        _scrollBar = new ScrollBar(config);
        _scrollBar.x = stage.stageWidth - 10;
        _scrollBar.y = 10;
        addChild(_scrollBar);
        _scrollBar.addEventListener(ScrollBar.POSITION_UPDATED, scrollbarUpdatedHandler);

        _timelineBTN = new CurrentPageButton();
        addChild(_timelineBTN);
        _timelineBTN.x = stage.stageWidth - 188;
        _timelineBTN.y = 301;
        _timelineBTN.touchable = true;
        _timelineBTN.addEventListener(starling.events.Event.TRIGGERED, showHideTimeline);
    }

    private function showHideTimeline(event:starling.events.Event):void {
        trace('[TIMELINE]: show or hide TimeLine');
        var t:Tween = new Tween(this, 1, Transitions.EASE_IN);
        if(this.x == 0)
        {
            t.animate("x", 148);
        }
        else
        {
            t.animate("x", 0);
        }
        Starling.juggler.add(t);
    }

    private function scrollbarUpdatedHandler(event:starling.events.Event):void {
        _container.y = _scrollBar.position * 100;
    }
}
}
