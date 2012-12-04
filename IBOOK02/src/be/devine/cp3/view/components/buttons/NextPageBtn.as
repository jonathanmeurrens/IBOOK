/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 02/12/12
 * Time: 10:45
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.buttons {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.AlignUtil;
import be.devine.cp3.vo.LinkVO;

import flash.display.BitmapData;

import flash.display.Shape;

import starling.core.Starling;

import starling.display.Button;
import starling.events.Event;
import starling.textures.Texture;

public class NextPageBtn extends Button{

    private var _linkVO:LinkVO;

    public function NextPageBtn(linkVO:LinkVO)
    {
        _linkVO = linkVO;

        // button background
        var background:Shape  = new Shape();
        background.graphics.beginFill(AppModel.getInstance().bookVO.themeColor);
        background.graphics.drawRect(0,0,40,40);
        background.graphics.endFill();

        var bmpData:BitmapData = new BitmapData(background.width, background.height, true, 0x0);
        bmpData.draw(background);

        // button arrow
        var arrow:Shape = new Shape();
        arrow.graphics.beginFill(AppModel.getInstance().bookVO.fontColor);
        arrow.graphics.moveTo(25, 20);
        arrow.graphics.lineTo(10, 10);
        arrow.graphics.lineTo(10, 30);
        arrow.graphics.lineTo(25, 20);
        arrow.graphics.endFill();
        arrow.x = 20;
        arrow.y = 20;

        bmpData.draw(arrow);

        super(Texture.fromBitmapData(bmpData));

        AlignUtil.alignToStage(this,Starling.current.stage,AlignUtil.BOTTOM, AlignUtil.RIGHT);

        addEventListener(Event.TRIGGERED, buttonTriggeredHandler);
    }

    private function buttonTriggeredHandler(e:Event):void
    {
        trace("[NextPageBtn] go to next page");
        AppModel.getInstance().goToNextPage();
    }
}
}
