/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 20/11/12
 * Time: 16:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.BookXMLParser;
import be.devine.cp3.view.Book;
import be.devine.cp3.view.Timeline;
import be.devine.cp3.view.components.preloader.Preloader;

import flash.display.BitmapData;

import flash.display.Screen;
import flash.display.Shape;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;

import flash.ui.Keyboard;

import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Image;


import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.textures.Texture;
import starling.textures.Texture;

public class Application extends Sprite
{
    private var _appModel:AppModel;
    private var _fontContainer:FontContainer = new FontContainer();

    private var _book:Book;
    private var _timeline:Timeline;
    private var _preloader:Preloader;
    private var _background:Shape;

    public function Application()
    {
        _appModel = AppModel.getInstance();

        /*_background = new Shape();
        _background.graphics.beginFill(0xEEEEEE);
        _background.graphics.lineStyle(1,0xFFFFFF);
        _background.graphics.drawRect(0,0,Starling.current.stage.stageWidth-10, Starling.current.stage.stageHeight-30);
        _background.x=Starling.current.stage.stageWidth/2-_background.width/2;
        _background.y=Starling.current.stage.stageHeight/2-_background.height/2;
        _background.graphics.endFill();
        var shadowFilter:DropShadowFilter = new DropShadowFilter();
        shadowFilter.color = 0x000000;
        shadowFilter.alpha = 0.60;
        shadowFilter.blurX = 6;
        shadowFilter.blurY = 6;
        shadowFilter.distance = 0;
        shadowFilter.angle = 90;
        _background.filters = [shadowFilter];
        var backgroundBitmap:BitmapData = new BitmapData(_background.width, _background.height,true,0x000000);
        backgroundBitmap.draw(_background);
        addChild(new Image(Texture.fromBitmapData(backgroundBitmap)));*/


        // start loading the books content as XML and parse it, data stored in appModel
        var bookXMLParser:BookXMLParser = new BookXMLParser();
        bookXMLParser.parse("assets/book.xml");

        _book = new Book();
        addChild(_book);

        _timeline = new Timeline();
        addChild(_timeline);

        _preloader = new Preloader();
        addChild(_preloader);
        _preloader.addEventListener(Preloader.PRELOADING_DONE, preloadingDoneHandler);

        _book.alpha=0;

        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(e:Event):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
    }

    private function keyboardHandler(event:KeyboardEvent):void
    {
        var key:uint = event.keyCode;
        switch (key) {
            case Keyboard.LEFT :
            case Keyboard.UP:
                _appModel.goToPreviousPage();
                break;
            case Keyboard.RIGHT :
            case Keyboard.DOWN:
                _appModel.goToNextPage();
                break;
        }
    }

    private function preloadingDoneHandler(e:Event):void
    {
        // fade in book
        var tween:Tween = new Tween(_book,2);
        tween.delay=2.5;
        tween.fadeTo(1);
        Starling.juggler.add(tween);

        // fade out preloader
        var tween:Tween = new Tween(_preloader,0.3);
        tween.delay=2;
        tween.fadeTo(0);
        Starling.juggler.add(tween);
    }
}
}
