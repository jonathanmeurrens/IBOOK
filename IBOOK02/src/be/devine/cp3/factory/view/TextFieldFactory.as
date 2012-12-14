/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 10/12/12
 * Time: 20:01
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.view
{
import be.devine.cp3.model.AppModel;

import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.text.AntiAliasType;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flashx.textLayout.formats.TextAlign;

import starling.core.Starling;
import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.textures.Texture;

public class TextFieldFactory
{
    public static function createBodyText(text:String):Sprite
    {
        var textContainer:Sprite = new Sprite();

        var textFormat:TextFormat = new TextFormat();
        textFormat.align = TextAlign.LEFT;
        textFormat.font="Verdana";
        textFormat.leading=1.7;
        textFormat.size=11;
        textFormat.color=0x000000;

        var textfield:TextField = new TextField();
        textfield.defaultTextFormat=textFormat;
        textfield.embedFonts=true;
        textfield.condenseWhite=true;
        textfield.wordWrap=true;
        textfield.multiline=true;
        textfield.width=350;
        textfield.autoSize=TextFieldAutoSize.LEFT;
        textfield.htmlText = text;
        textfield.antiAliasType = AntiAliasType.ADVANCED;

        var snapshot:BitmapData = new BitmapData(textfield.width, textfield.height, true, 0x00000000);
        snapshot.draw(textfield, new Matrix());

        var background:Quad = new Quad(textfield.width+50,textfield.height+50,0xFFFFFF);
        textContainer.addChild(background);
        textContainer.setChildIndex(background,0);

        var textImage:Image = new Image(Texture.fromBitmapData(snapshot));
        textContainer.addChild(textImage);
        textImage.x = textImage.y = 25;

        return textContainer;
    }

    public static function createTitleText(text:String):Sprite
    {
        var textContainer:Sprite = new Sprite();

        var textFormat:TextFormat = new TextFormat();
        textFormat.align = TextAlign.LEFT;
        textFormat.font="Futura Std Medium Condensed";
        textFormat.leading=1.9;
        textFormat.size=46;
        textFormat.color=AppModel.getInstance().bookVO.fontColor;

        var textfield:TextField = new TextField();
        textfield.defaultTextFormat = textFormat;
        textfield.embedFonts=true;
        textfield.text = text.toUpperCase();
        textfield.wordWrap=true;
        textfield.multiline=true;
        textfield.setTextFormat(textFormat);
        textfield.antiAliasType = AntiAliasType.ADVANCED;

        textfield.width=350;
        textfield.autoSize=TextFieldAutoSize.LEFT;

        var snapshot:BitmapData = new BitmapData(textfield.width, textfield.height, true, 0x00000000);
        snapshot.draw(textfield, new Matrix());

        var background:Quad = new Quad(textfield.width+50,textfield.height+30,AppModel.getInstance().bookVO.themeColor);
        textContainer.addChild(background);
        textContainer.setChildIndex(background,0);

        var textImage:Image = new Image(Texture.fromBitmapData(snapshot));
        textContainer.addChild(textImage);
        textImage.x = textImage.y = 18;

        return textContainer;
    }

    public static function createLinkText(label:String):Sprite
    {
        var textContainer:Sprite = new Sprite();

        var textFormat:TextFormat = new TextFormat();
        textFormat.align = TextAlign.LEFT;
        textFormat.font="Verdana";
        textFormat.leading=1.7;
        textFormat.size=11;
        textFormat.underline=true;
        textFormat.color=AppModel.getInstance().bookVO.fontColor;


        var textfield:TextField = new TextField();
        textfield.text = label;
        textfield.wordWrap=true;
        textfield.multiline=true;
        textfield.setTextFormat(textFormat);
        textfield.autoSize=TextFieldAutoSize.LEFT;
        textfield.width=170;
        textfield.antiAliasType = AntiAliasType.ADVANCED;

        var snapshot:BitmapData = new BitmapData(textfield.width, textfield.height, true, 0x00000000);
        snapshot.draw(textfield, new Matrix());

        var background:Quad = new Quad(textfield.width+20,textfield.height+20,AppModel.getInstance().bookVO.themeColor);
        textContainer.addChild(background);
        textContainer.setChildIndex(background,0);

        var textImage:Image = new Image(Texture.fromBitmapData(snapshot));
        textContainer.addChild(textImage);
        textImage.x = textImage.y = 10;

        return textContainer;
    }
}
}
