/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 02/12/12
 * Time: 10:45
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.buttons {
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.AlignUtil;
import be.devine.cp3.vo.LinkVO;

import starling.core.Starling;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class NextPageBtn extends Sprite{


    private var _linkVO:LinkVO;

    public function NextPageBtn(linkVO:LinkVO)
    {
        _linkVO = linkVO;

        var label:Sprite = TextFieldFactory.createLinkText(linkVO.label);
        addChild(label);


        AlignUtil.alignToStage(this,Starling.current.stage,linkVO.vAlign, linkVO.hAlign);
        x +=  linkVO.xOffset;
        y += linkVO.yOffset;

        addEventListener(TouchEvent.TOUCH, buttonTouchedHandler);
    }

    private function buttonTouchedHandler(e:TouchEvent):void
    {
        var touch:Touch = e.getTouch(stage);
        if(touch.phase == TouchPhase.ENDED )
            AppModel.getInstance().currentPageIndex = _linkVO.id;
    }
}
}
