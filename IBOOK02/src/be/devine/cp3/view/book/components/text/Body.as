/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 20:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.book.components.text {
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.util.align.AlignUtil;
import be.devine.cp3.vo.BodyVO;

import starling.core.Starling;
import starling.display.Sprite;

public class Body extends Sprite{

    private var _bodyVO:BodyVO;

    public function Body(bodyVO:BodyVO)
    {
        _bodyVO = bodyVO;

        addChild(TextFieldFactory.createBodyText(_bodyVO.body));
        AlignUtil.alignToStage(this,Starling.current.stage,bodyVO.vAlign, bodyVO.hAlign);
        x +=  _bodyVO.xOffset;
        y += _bodyVO.yOffset;
    }
}
}
