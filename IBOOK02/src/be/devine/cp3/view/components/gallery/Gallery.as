/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 29/11/12
 * Time: 14:06
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.gallery
{
import be.devine.cp3.model.GalleryModel;
import be.devine.cp3.util.AlignUtil;
import be.devine.cp3.vo.GalleryVO;

import flash.events.TimerEvent;

import flash.utils.Timer;

import starling.core.Starling;

import starling.display.Sprite;

public class Gallery extends Sprite
{
    private var _background:Picture;
    private var _thumbnails:Thumbnails;
    private var _galleryModel:GalleryModel;
    private var _timer:Timer;

    public function Gallery(galleryVO:GalleryVO)
    {
        _galleryModel = new GalleryModel();

        _background = new Picture(_galleryModel);
        addChild(_background);

        _thumbnails = new Thumbnails(_galleryModel);
        addChild(_thumbnails);

        _galleryModel.images = galleryVO.images;

        AlignUtil.alignToStage(_thumbnails,Starling.current.stage,AlignUtil.BOTTOM, AlignUtil.CENTER);
    }

    private function setSlideshow():void
    {
        if(_timer==null)
        {
            _timer = new Timer(10000);
            _timer.addEventListener(TimerEvent.TIMER, timerHandler);
        }

        if(_galleryModel.isAnimationsOn)
            _timer.start();
        else
            _timer.stop();
    }

    private function timerHandler(e:TimerEvent):void
    {
        _galleryModel.goToNextImage();
    }

    public function toggleAnimations(isAnimationsOn:Boolean)
    {
        _galleryModel.isAnimationsOn = isAnimationsOn;
        setSlideshow();
    }
}
}
