/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 01/12/12
 * Time: 18:00
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {
public class BodyVO extends ComponentVO
{
    private var _body:String="";
    private var _vAlign:String="bottom";
    private var _hAlign:String="left";

    public function get body():String {
        return _body;
    }

    public function set body(value:String):void {
        _body = value;
    }

    public function get vAlign():String {
        return _vAlign;
    }

    public function set vAlign(value:String):void {
        if(value.toLowerCase() == "top" || value.toLowerCase() == "bottom" || value.toLowerCase() == "center" )
            _vAlign = value;
    }

    public function get hAlign():String {
        return _hAlign;
    }

    public function set hAlign(value:String):void {
        if(value.toLowerCase() == "left" || value.toLowerCase() == "right" || value.toLowerCase() == "center" )
            _hAlign = value;
    }
}
}
