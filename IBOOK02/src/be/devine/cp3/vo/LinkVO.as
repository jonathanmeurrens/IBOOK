/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 03/12/12
 * Time: 11:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {
public class LinkVO extends ComponentVO
{
    private var _id:uint = 0;
    private var _label:String = "";

    public function LinkVO()
    {

    }

    public function get id():uint {
        return _id;
    }

    public function set id(value:uint):void {
        _id = value;
    }

    public function get label():String {
        return _label;
    }

    public function set label(value:String):void {
        _label = value;
    }
}
}
