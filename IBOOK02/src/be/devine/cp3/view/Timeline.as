/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 27/11/12
 * Time: 18:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.components.buttons.CurrentPageButton;
import be.devine.cp3.view.components.scrollbar.ScrollBar;
import be.devine.cp3.view.components.scrollbar.ScrollBarOptions;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Timeline extends Sprite{

    //variables

    private var _appModel:AppModel;
    private var _background:Quad;
    private var _container:Sprite;
    private var _scrollBar:ScrollBar;
    private var _timelineBTN:CurrentPageButton;
    private var _currentThumb:Quad;
    private var _pages:Vector.<Page>;

    public function Timeline() {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.BOOK_CHANGED, bookChangedHandler);
    }

    //TODO: Default inklappen
    private function bookChangedHandler(event:flash.events.Event):void {
        //background timeline
        _background =  new Quad(130,stage.stageHeight,_appModel.bookVO.themeColor);
        _background.x = stage.stageWidth - 130;
        addChild(_background);

        //aanduiden welke page geseleteerd is
        _currentThumb = new Quad(120,110,0xffffff);
        addChild(_currentThumb);
        _currentThumb.y = 6;
        _currentThumb.x = _background.x;

        //container waarin alle pages staan
        _container = new Sprite();
        _container.x = stage.stageWidth - 120;
        addChild(_container);

        //toevoegen van de pages
        _pages = new Vector.<Page>();
        var hulpY:int = 13;
        for each(var pageVO:PageVO in _appModel.bookVO.pages)
        {
            var page:Page = new Page(pageVO);
            page.width = 1002;
            page.height = 75;
            page.setAsThumbnail();
            page.y = hulpY;
            _container.addChild(page);

            page.addEventListener(TouchEvent.TOUCH, pageTouch);

            hulpY += page.height + 35;
            _pages.push(page);
        }

        addScrollbar();

        addTimelineBTN();

        //luisteren naar het pagechanged event
        _appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, updateIndex);
    }

    private function updateIndex(event:flash.events.Event):void {
        //als de paginaindex > dan 3 dan moet _container verschuiven.
        var timelineTween:Tween = new Tween(_timelineBTN, 0.5, Transitions.LINEAR);
        var currentTween:Tween = new Tween(_currentThumb, 0.5, Transitions.LINEAR);
        var containerTween:Tween = new Tween(_container, 1, Transitions.LINEAR);

        var timelineY:int = new int();
        var currentY:int = new int();
        var containerY:int = new int();

        if (_appModel.currentPageIndex > 3)
        {
            timelineY = 364;
            currentY = 324;
            containerY = -122 * (_appModel.currentPageIndex - 3);
            var scrollbarY:Number =  -(containerY)/(_container.height-425);
            _scrollBar.setThumbPosition(scrollbarY);
        }
        else
        {
            timelineY = _pages[_appModel.currentPageIndex].y + _pages[_appModel.currentPageIndex].height/2-15;
            currentY = _pages[_appModel.currentPageIndex].y - 6;
            containerY = 0;
            _scrollBar.setThumbPosition(0);
        }

        timelineTween.animate("y", timelineY);
        currentTween.animate("y",currentY);
        containerTween.animate("y", containerY);
        Starling.juggler.add(timelineTween);
        Starling.juggler.add(currentTween);
        Starling.juggler.add(containerTween);
    }

    private function pageTouch(event:TouchEvent):void {
        var touch:Touch = event.getTouch(stage);
        var target:Page = event.currentTarget as Page;
        if(touch.phase == TouchPhase.ENDED ){
            _appModel.currentPageIndex = _pages.indexOf(target);
        }
        if(touch.phase == TouchPhase.HOVER)
        {
            //TODO: titel tevoorschijn laten komen
          /* var components:Vector.<ComponentVO> = _appModel.bookVO.pages[_pages.indexOf(target)]._components;
            for each(var object:DisplayObject in components)
            {
                if(object is Button)
                {
                    object.visible=false;
                }
            }*/
        }
    }

    private function showHideTimeline(event:starling.events.Event):void {
        trace('[TIMELINE]: show or hide TimeLine');
        var t:Tween = new Tween(this, 0.1, Transitions.EASE_IN);
        if(this.x == 0)
        {
            t.animate("x", 130);
        }
        else
        {
            t.animate("x", 0);
        }
        Starling.juggler.add(t);
    }

    private function scrollbarUpdatedHandler(event:starling.events.Event):void {
        var containerY:int = Math.floor(-((_container.height - 425) * _scrollBar.position));
        trace(containerY);
        _container.y = containerY;
    }

    //scrollbar toevoegen

    private function addScrollbar():void{
        //opmaak van de Scrollbar
        var config:ScrollBarOptions = new ScrollBarOptions();
        config.height = stage.stageHeight;
        config.width = 7;
        config.thumbcolor = 0xFFFFFF;
        config.thumbheight = 40;
        config.trackcolor = _appModel.bookVO.themeColor;

        //scrollbar toevoegen
        _scrollBar = new ScrollBar(config);
        _scrollBar.x = stage.stageWidth - 9;
        _scrollBar.y = 10;
        addChild(_scrollBar);
        _scrollBar.addEventListener(ScrollBar.POSITION_UPDATED, scrollbarUpdatedHandler);
    }

    //TimelineButton toevoegen

    private function addTimelineBTN():void{
        //button om timeline tevoorschijn te laten komen
        _timelineBTN = new CurrentPageButton();
        addChild(_timelineBTN);
        _timelineBTN.x = stage.stageWidth - 170;
        _timelineBTN.y = _pages[_appModel.currentPageIndex].y + _pages[_appModel.currentPageIndex].height/2-15;
        _timelineBTN.touchable = true;
        _timelineBTN.addEventListener(starling.events.Event.TRIGGERED, showHideTimeline);
    }
}
}
