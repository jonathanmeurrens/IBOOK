package {
import be.devine.cp3.Application;

import flash.display.MovieClip;
import flash.display.Screen;
import flash.display.Shape;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;

import starling.core.Starling;

[SWF(frameRate=60,width=1024,height=768, backgroundColor=0x000000)]
public class Main extends MovieClip {

    private var _starling:Starling;

    public function Main() {

        setupCustomChromeWindow();

        //Align and Scale
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        //starling instellen
        _starling = new Starling(Application, stage);
        _starling.start();

        //resize handler
        stage.addEventListener(Event.RESIZE, resizeHandler);
    }

    private function setupCustomChromeWindow(width:uint=1024,height:uint=768):void
    {
        stage.nativeWindow.bounds = new Rectangle(
                (Screen.mainScreen.bounds.width - width) *.5,
                (Screen.mainScreen.bounds.height - height) *.5,
                width,
                height
        );
        stage.addEventListener(MouseEvent.MOUSE_DOWN,moveWindow);
    }

    private function moveWindow(event:MouseEvent):void {
        this.stage.nativeWindow.startMove();
    }

    private function minimizeWindow():void {
        this.stage.nativeWindow.minimize();
    }

    private function maximizeWindow():void {
        this.stage.nativeWindow.maximize();
    }

    private function restoreWindow():void {
        this.stage.nativeWindow.restore();
    }

    private function closeWindow():void {
        this.stage.nativeWindow.close();
    }


    private function resizeHandler(event:Event):void {
        if(_starling != null) {

        }
    }
}
}
