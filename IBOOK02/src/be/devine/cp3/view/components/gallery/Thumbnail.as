/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 04/12/12
 * Time: 18:01
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.gallery {
import be.devine.cp3.model.AppModel;

import flash.display.BitmapData;
import flash.display.Shape;

import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;

public class Thumbnail extends Sprite
{
    public function Thumbnail()
    {
        var bullet:Shape = new Shape();
        //bullet.graphics.beginFill(AppModel.getInstance().bookVO.themeColor);
        bullet.graphics.lineStyle(1,AppModel.getInstance().bookVO.themeColor);
        bullet.graphics.drawEllipse(0,0,10,10);
        //bullet.graphics.endFill();
        var bitmapBullet:BitmapData = new BitmapData(bullet.width, bullet.height,true,0x000000);
        bitmapBullet.draw(bullet);
        addChild(new Image(Texture.fromBitmapData(bitmapBullet)));
    }
}
}
