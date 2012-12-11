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
import be.devine.cp3.vo.TitleVO;

import starling.core.Starling;
import starling.display.Sprite;

public class Title extends Sprite
{
    private var _titleVO:TitleVO;

    public function Title(titleVO:TitleVO)
    {
        _titleVO = titleVO;
        addChild(TextFieldFactory.createTitleText(_titleVO.title));

        AlignUtil.alignToStage(this,Starling.current.stage,titleVO.vAlign, titleVO.hAlign);
    }
}
}
