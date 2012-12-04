/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 20:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.text {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.AlignUtil;
import be.devine.cp3.vo.TitleVO;

import starling.core.Starling;
import starling.display.Quad;

public class Title extends MyTextField
{
    private var _background:Quad;
    private var _appModel:AppModel;
    private var _titleVO:TitleVO;

    public function Title(titleVO:TitleVO)
    {
        _appModel = AppModel.getInstance();
        _titleVO = titleVO;

        super(1,1,_titleVO.title.toUpperCase(),"Didot",30,_appModel.bookVO.fontColor);

        _background = new Quad(width+20,height,_appModel.bookVO.themeColor);
        _background.x -= 10;
        addChild(_background);
        setChildIndex(_background,0);

        AlignUtil.alignToStage(this,Starling.current.stage,titleVO.vAlign, titleVO.hAlign);
    }
}
}
