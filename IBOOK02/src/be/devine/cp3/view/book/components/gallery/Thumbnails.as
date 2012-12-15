/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 29/11/12
 * Time: 14:35
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.book.components.gallery {
import be.devine.cp3.model.GalleryModel;
import be.devine.cp3.vo.ImageVO;

import flash.display.BitmapData;
import flash.display.Shape;
import flash.events.Event;
import flash.geom.Matrix;

import starling.animation.Juggler;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class Thumbnails extends Sprite
{
    private var _galleryModel:GalleryModel;
    private var _thumbnails:Vector.<Thumbnail>;
    private var _indicator:Image;

    public function Thumbnails(galleryModel:GalleryModel)
    {
        _galleryModel = galleryModel;
        _galleryModel.addEventListener(GalleryModel.IMAGES_CHANGED, imagesChangedHandler);
        _galleryModel.addEventListener(GalleryModel.SELECTED_INDEX_CHANGED, selectedIndexChangedHandler);
    }

    private function selectedIndexChangedHandler(e:Event):void
    {
        var tween:Tween = new Tween(_indicator,0.2);
        tween.animate('x',_thumbnails[_galleryModel.selectedImageIndex].x+1);
        Starling.juggler.add(tween);
    }

    private function drawIndicator():void
    {
        var bullet:Shape = new Shape();
        bullet.graphics.beginFill(0xFFFFFF);
        bullet.graphics.drawEllipse(0,0,8,8);
        bullet.graphics.endFill();
        var bitmapBullet:BitmapData = new BitmapData(bullet.width, bullet.height,true,0x000000);
        bitmapBullet.draw(bullet);
        _indicator = new Image(Texture.fromBitmapData(bitmapBullet));
        _indicator.x = _indicator.y = 1;
        addChild(_indicator);
    }

    private function imagesChangedHandler(e:Event):void
    {
        var xPos:int = 0;
        _thumbnails = new Vector.<Thumbnail>();
        for each(var image:ImageVO in _galleryModel.images)
        {
            var thumbnail:Thumbnail = new Thumbnail();
            thumbnail.x = xPos;
            thumbnail.addEventListener(TouchEvent.TOUCH, thumbTouchHandler);
            xPos+=thumbnail.width+10;
            addChild(thumbnail);
            _thumbnails.push(thumbnail);
        }
        drawIndicator();
    }

    private function thumbTouchHandler(e:TouchEvent):void
    {
        var touch:Touch = e.getTouch(e.currentTarget as DisplayObject);
        if(touch!=null)
        {
            switch(touch.phase)
            {
                case TouchPhase.BEGAN:
                    _galleryModel.selectedImageIndex=_thumbnails.indexOf(e.currentTarget);
                    _galleryModel.loop=false;
            }
        }
    }
}
}
