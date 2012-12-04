/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 01/12/12
 * Time: 18:00
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {
import be.devine.cp3.util.AlignUtil;

public class TitleVO extends ComponentVO
{
    private var _title:String="";
    private var _vAlign:String="top";
    private var _hAlign:String="left";

    public function get title():String {
        return _title;
    }

    public function set title(value:String):void {
        _title = value;
    }

    public function get vAlign():String {
        return _vAlign;
    }

    public function set vAlign(value:String):void {
        if(value == AlignUtil.TOP || value.toLowerCase() == AlignUtil.BOTTOM || value.toLowerCase() == AlignUtil.CENTER )
            _vAlign = value.toLowerCase();
    }

    public function get hAlign():String {
        return _hAlign;
    }

    public function set hAlign(value:String):void {
        if(value.toLowerCase() == AlignUtil.LEFT|| value.toLowerCase() == AlignUtil.RIGHT || value.toLowerCase() == AlignUtil.CENTER )
            _hAlign = value.toLowerCase();
    }
}
}
