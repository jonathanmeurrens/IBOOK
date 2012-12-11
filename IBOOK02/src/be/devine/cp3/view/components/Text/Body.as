/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 20:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.text {
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.util.AlignUtil;
import be.devine.cp3.vo.BodyVO;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Body extends Sprite{

    private var _bodyVO:BodyVO;

    public function Body(bodyVO:BodyVO)
    {
        _bodyVO = bodyVO;

        addChild(TextFieldFactory.createBodyText(_bodyVO.body));

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
