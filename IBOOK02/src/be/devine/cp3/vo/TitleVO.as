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

    public function TitleVO()
    {
        vAlign=AlignUtil.TOP;
        hAlign=AlignUtil.LEFT;
    }

    public function get title():String {
        return _title;
    }

    public function set title(value:String):void {
        _title = value;
    }


}
}
