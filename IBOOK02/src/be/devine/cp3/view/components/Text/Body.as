/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 20:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.text {
import be.devine.cp3.util.AlignUtil;
import be.devine.cp3.view.components.*;
import be.devine.cp3.view.components.scrollbar.Scrollbar;
import be.devine.cp3.vo.BodyVO;

import flash.display.BitmapData;
import flash.display.Shape;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;

import starling.core.RenderSupport;
import starling.core.Starling;

import starling.display.DisplayObject;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.textures.Texture;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Body extends MyTextField{

    private var _bodyBackgroundImage:Image;
    private var _bodyVO:BodyVO;

    public function Body(bodyVO:BodyVO)
    {
        _bodyVO = bodyVO;
        super(300,30,_bodyVO.body,"Avenir",12);

        var bodyBackground = new Shape();
        bodyBackground.graphics.beginFill(0xFFFFFF);
        bodyBackground.graphics.drawRect(0,0,width+30,height+30);
        bodyBackground.graphics.endFill();
        bodyBackground.filters = [ new DropShadowFilter(4, 45, 0x000000, 0.3, 17, 17, 2, 3) ];
        var bmpData:BitmapData = new BitmapData(bodyBackground.width+20, bodyBackground.height, true, 0x0);
        bmpData.draw(bodyBackground);
        var texture:Texture = Texture.fromBitmapData(bmpData);
        _bodyBackgroundImage = new Image(texture);
        _bodyBackgroundImage.x = x-15;
        _bodyBackgroundImage.y = y-15;
        addChild(_bodyBackgroundImage);
        setChildIndex(_bodyBackgroundImage,0);

        AlignUtil.alignToStage(this,Starling.current.stage,bodyVO.vAlign, bodyVO.hAlign);
        addEventListener(TouchEvent.TOUCH, touchHandler);
    }

    private function touchHandler(e:TouchEvent):void
    {
        var touch:Touch = e.getTouch(e.currentTarget as DisplayObject);

        if(touch!=null)
        {
            switch(touch.phase)
            {
                case TouchPhase.BEGAN:
                    trace("BEGAN",touch.getLocation(this));
                    break;
                case TouchPhase.MOVED:
                    trace("MOVED",touch.getLocation(this).y);
                    break;
                case TouchPhase.ENDED:
                    trace("ENDED");
                    break;
            }
        }
    }
}
}
