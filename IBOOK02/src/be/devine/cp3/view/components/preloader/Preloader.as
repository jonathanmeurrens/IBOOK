/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 11/12/12
 * Time: 15:29
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.preloader {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.AlignUtil;

import flash.events.Event;

import starling.animation.Tween;

import starling.core.Starling;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Event;

public class Preloader extends Sprite
{
    private var _appModel:AppModel;
    private var _progressBar:Quad;
    private var _background:Quad;
    private var _tween:Tween;
    private var _width:uint=250;
    private var _height:uint = 10;

    public static const PRELOADING_DONE:String = "PRELOADING_DONE";

    public function Preloader()
    {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.PROGRESS_CHANGED, progressChangedHandler);

        _background = new Quad(_width,_height,0x555555);
        addChild(_background);

        _progressBar = new Quad(1,height,0xFFFFFF);
        addChild(_progressBar);

        AlignUtil.alignToStage(this,Starling.current.stage,AlignUtil.CENTER, AlignUtil.CENTER);
        //_progressBar.y = Starling.current.stage.stageHeight/2-_progressBar.height/2;
    }

    private function progressChangedHandler(e:flash.events.Event):void
    {
        trace("[Peloader]"+(_appModel.pagesLoadedProgress/_appModel.totalToLoad)*100);
        //_progressBar.width = ;
        _tween = new Tween(_progressBar,1);
        _tween.delay=0.5;
        _tween.animate("width",_width*((_appModel.pagesLoadedProgress/_appModel.totalToLoad)));
        Starling.juggler.add(_tween);

        if(_appModel.pagesLoadedProgress==_appModel.totalToLoad)
        {
            dispatchEvent(new starling.events.Event(Preloader.PRELOADING_DONE));
        }
    }
}
}
