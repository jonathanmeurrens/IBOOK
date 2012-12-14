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
import be.devine.cp3.view.components.text.Title;
import be.devine.cp3.vo.ComponentVO;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Quad;

import starling.display.DisplayObject;
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
    private const CURRENT_THUMB_Y_OFFSET=5;
    private var _thumbnails:Vector.<TimelineThumbnail>;

    public function Timeline() {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.BOOK_CHANGED, bookChangedHandler);
    }

    private function bookChangedHandler(event:flash.events.Event):void {
        _thumbnails = new Vector.<TimelineThumbnail>();

        //background timeline
        _background =  new Quad(130,stage.stageHeight,_appModel.bookVO.themeColor);
        _background.x = stage.stageWidth - _background.width;
        addChild(_background);

        //aanduiden welke page geseleteerd is
        _currentThumb = new Quad(_background.width-10,95,0xffffff);
        addChild(_currentThumb);
        _currentThumb.y = CURRENT_THUMB_Y_OFFSET;
        _currentThumb.x = _background.x;

        //container waarin alle pages staan
        _container = new Sprite();
        _container.x = stage.stageWidth - 120;
        _container.addChild(_currentThumb);
        addChild(_container);


        //toevoegen van de thumbnails
        var hulpY:int = 13;
        for each(var pageVO:PageVO in _appModel.bookVO.pages)
        {
            var thumb:TimelineThumbnail = new TimelineThumbnail(pageVO);
            thumb.y = hulpY;
            _container.addChild(thumb);

            thumb.addEventListener(TouchEvent.TOUCH, thumbTouch);

            hulpY += thumb.height + 10;
            _thumbnails.push(thumb);
        }

        addScrollbar();
        addTimelineBTN();

        //luisteren naar het pagechanged event
        _appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, updateIndex);

        //default hide
        showHideTimeline(null);
    }

    private function updateIndex(event:flash.events.Event):void {
        //als de paginaindex > dan 3 dan moet _container verschuiven.
        var timelineTween:Tween = new Tween(_timelineBTN, 0.2, Transitions.LINEAR);
        var currentTween:Tween = new Tween(_currentThumb, 0.2, Transitions.LINEAR);

        var timelineY:int;
        var currentY:int;

        timelineY = _thumbnails[_appModel.currentPageIndex].y + _thumbnails[_appModel.currentPageIndex].height/2-15;
        currentY = _thumbnails[_appModel.currentPageIndex].y-CURRENT_THUMB_Y_OFFSET;
        _scrollBar.position = _thumbnails[_appModel.currentPageIndex].y/_container.height;

        timelineTween.animate("y", timelineY);
        currentTween.animate("y",currentY);

        Starling.juggler.add(timelineTween);
        Starling.juggler.add(currentTween);
    }

    private function thumbTouch(event:TouchEvent):void {
        var touch:Touch = event.getTouch(stage);
        var target:TimelineThumbnail = event.currentTarget as TimelineThumbnail;
        if(touch.phase == TouchPhase.ENDED ){
            _appModel.currentPageIndex = _thumbnails.indexOf(target);
        }
    }

    private function showHideTimeline(event:starling.events.Event):void {
        trace('[TIMELINE]: show or hide TimeLine');
        var t:Tween = new Tween(this, 0.1, Transitions.EASE_IN);
        if(this.x == 0)
            t.animate("x", 130);
        else
            t.animate("x", 0);
        Starling.juggler.add(t);
    }

    private function scrollbarUpdatedHandler(event:starling.events.Event):void {
        var containerY:int = Math.floor(-((_container.height - 425) * _scrollBar.position));
        var containerTween:Tween = new Tween(_container,0.2,Transitions.LINEAR);
        containerTween.animate("y", containerY);
        Starling.juggler.add(containerTween);
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
        _container.addChild(_timelineBTN);
        _timelineBTN.x = stage.stageWidth-_timelineBTN.width-width;
        _timelineBTN.y = _thumbnails[_appModel.currentPageIndex].y + _thumbnails[_appModel.currentPageIndex].height/2-11;
        _timelineBTN.touchable = true;
        _timelineBTN.addEventListener(starling.events.Event.TRIGGERED, showHideTimeline);
    }
}
}
