/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 21/11/12
 * Time: 21:17
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo
{
public class BookVO
{
    private var _title:String="Untitled Book";
    private var _themeColor:Number=0x31f1dd;
    private var _fontColor:Number=0x222222;
    private var _pages:Vector.<PageVO>=new Vector.<PageVO>();

    public function get title():String {
        return _title;
    }

    public function set title(value:String):void {
        if(_title!="")
            _title = value;
    }

    public function get themeColor():Number {
        return _themeColor;
    }

    public function set themeColor(value:Number):void {
        if(_themeColor>0)
            _themeColor = value;
    }

    public function get fontColor():Number {
        return _fontColor;
    }

    public function set fontColor(value:Number):void {
        if(_fontColor>0)
            _fontColor = value;
    }

    public function get pages():Vector.<PageVO> {
        return _pages;
    }

    public function set pages(value:Vector.<PageVO>):void {
        _pages = value;
    }
}
}
