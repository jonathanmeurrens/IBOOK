/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 27/11/12
 * Time: 22:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.text {
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class MyTextField extends TextField{

    [Embed(source="/../fonts/avenir.ttf", embedAsCFF="false", fontFamily="Avenir")]
    private static const Avenir:Class;

    [Embed(source="/../fonts/didot.ttf", embedAsCFF="false", fontFamily="Didot")]
    private static const Didot:Class;

    public function MyTextField(width:int, height:int, text:String, fontName:String = "Verdana", fontSize:Number = 12, color:uint=0, bold:Boolean=false)
    {
        super(width, height, text, fontName, fontSize, color, bold);
        vAlign = VAlign.TOP;
        hAlign = HAlign.LEFT;

        checkTextHeight();
    }

    override public function set text(value:String):void {
        super.text = value;
        checkTextHeight();
    }

    private function checkTextHeight():void{
        if (this.height < this.textBounds.height) {
            this.height = this.textBounds.height + 4;
        }
    }
}
}
