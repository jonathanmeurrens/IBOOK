/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 01/12/12
 * Time: 18:00
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {
import be.devine.cp3.util.AlignUtil;

public class BodyVO extends ComponentVO
{
    private var _body:String="";

    public function BodyVO()
    {
        vAlign = AlignUtil.BOTTOM;
        hAlign = AlignUtil.LEFT;
    }

    public function get body():String {
        return _body;
    }

    public function set body(value:String):void {
        _body = value;
    }
}
}
