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

    [Embed(source="/../fonts/FuturaStd-CondensedBold.otf", embedAsCFF="false", fontFamily="FuturaCondensedBold")]
    private static const FuturaCondensedBold:Class;

    [Embed(source="/../fonts/Verdana.ttf", embedAsCFF="false", fontFamily="Verdana")]
    private static const Verdana:Class;

    public function MyTextField(width:int, height:int, text:String, fontName:String = "Verdana", fontSize:Number = 12, color:uint=0, bold:Boolean=false)
    {
        super(width, height, text, fontName, fontSize, color, bold);
        vAlign = VAlign.TOP;
        hAlign = HAlign.LEFT;

        checkTextSize();
    }

    override public function set text(value:String):void {
        super.text = value;
        checkTextSize();
    }

    private function checkTextSize():void{
        if (this.height < this.textBounds.height) {
            this.height = this.textBounds.height + 4;
        }
        if (this.width < this.textBounds.width) {
            this.width = this.textBounds.width + 4;
        }
    }
}
}
