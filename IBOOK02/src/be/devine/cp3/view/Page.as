/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 26/11/12
 * Time: 17:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view
{
import be.devine.cp3.view.components.Picture;
import be.devine.cp3.vo.PageVO;

import starling.display.Quad;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Page extends Sprite
    {
        private var _pageVO:PageVO;
        private var _background:Picture;
        private var _bodyTXT:TextField;
        private var _bodyBackground:Quad;

        public function Page(pageVO:PageVO)
        {
            _pageVO = pageVO;

            _background = new Picture(_pageVO.background_image);
            trace("[Page] "+_pageVO.background_image);
            addChild(_background);

            _bodyTXT = new TextField(200,1000,_pageVO.body,"Arial",14);
            _bodyTXT.hAlign=HAlign.LEFT;
            _bodyTXT.vAlign=VAlign.BOTTOM;
            addChild(_bodyTXT);

            _bodyBackground = new Quad(_bodyTXT.width,_bodyTXT.height);
            addChild(_bodyBackground);
            setChildIndex(_bodyBackground,getChildIndex(_background)+1);
        }
    }
}
