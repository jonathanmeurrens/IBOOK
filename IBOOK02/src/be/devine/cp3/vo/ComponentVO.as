/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 03/12/12
 * Time: 10:51
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {
import be.devine.cp3.util.AlignUtil;

public class ComponentVO
{
    private var _vAlign:String="top";
    private var _hAlign:String="left";
    private var _xOffset:int;
    private var _yOffset:int;

    public function ComponentVO()
    {

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

    public function set xOffset(value:int):void
    {
        _xOffset = value;
    }

    public function get xOffset():int
    {
        return _xOffset;
    }

    public function set yOffset(value:int):void
    {
        _yOffset = value;
    }

    public function get yOffset():int
    {
        return _yOffset;
    }
}
}
