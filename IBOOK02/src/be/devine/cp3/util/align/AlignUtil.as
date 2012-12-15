/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 01/12/12
 * Time: 20:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.util.align
{
import starling.display.DisplayObject;
import starling.display.DisplayObject;
import starling.display.Stage;

public class AlignUtil
{
    public static const LEFT:String = "left";
    public static const RIGHT:String = "right";
    public static const CENTER:String = "center";
    public static const TOP:String = "top";
    public static const BOTTOM:String = "bottom";

    public function AlignUtil()
    {

    }

    public static function alignToStage(object:DisplayObject,parent:Stage,vAlign:String,hAlign:String,vMargin:uint = 40, hMargin:uint=40):void
    {
        switch(vAlign)
        {
            case TOP:
                object.y=vMargin;
                break;
            case BOTTOM:
                object.y = parent.stageHeight-object.height-vMargin;
                break;
            case CENTER:
                object.y = parent.stageHeight/2-object.height/2;
                break;
        }

        switch(hAlign)
        {
            case LEFT:
                object.x=hMargin;
                break;
            case RIGHT:
                object.x = parent.stageWidth-object.width-hMargin;
                break;
            case CENTER:
                object.x = parent.stageWidth/2-object.width/2;
                break;
        }
    }
}
}
