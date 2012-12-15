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
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import flashx.textLayout.formats.TextAlign;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.textures.Texture;

public class TextFieldFactory
{
    private static var config:Object={
        text:"undefined",
        font:"Verdana",
        leading:1.7,
        size:15,
        color:0x000000,
        condenseWhite:false,
        width:300,
        backgroundColor:0xFFFFFF,
        leftMargin:0,
        topMargin:0,
        uppercase:false,
        underline:false,
        textAlign:TextAlign.LEFT
    };

    public static function createText(config:Object):Sprite
    {
        var textContainer:Sprite = new Sprite();

        var textFormat:TextFormat = new TextFormat();
        textFormat.align = config.textAlign;
        textFormat.font=config.font;
        textFormat.leading=config.leading;
        textFormat.size=config.size;
        textFormat.color=config.color;
        textFormat.underline=config.underline;

        var textfield:TextField = new TextField();
        textfield.defaultTextFormat=textFormat;
        textfield.embedFonts=true;
        textfield.condenseWhite=config.condenseWhite;
        textfield.wordWrap=true;
        textfield.multiline=true;
        textfield.width=config.width;
        textfield.autoSize=TextFieldAutoSize.LEFT;
        textfield.htmlText = config.uppercase==true?String(config.text).toUpperCase():config.text;
        textfield.antiAliasType = AntiAliasType.ADVANCED;

        var snapshot:BitmapData = new BitmapData(textfield.width, textfield.height, true, 0x00000000);
        snapshot.draw(textfield, new Matrix());

        if(config.backgroundColor)
        {
            var background:Quad = new Quad(textfield.width+config.leftMargin*2,textfield.height+config.topMargin*2,config.backgroundColor);
            textContainer.addChild(background);
            textContainer.setChildIndex(background,0);
        }

        var textImage:Image = new Image(Texture.fromBitmapData(snapshot));
        textContainer.addChild(textImage);
        textImage.x = config.leftMargin;
        textImage.y = config.topMargin;
        return textContainer;
    }

    public static function createBodyText(text:String):Sprite
    {
        config.text=text;
        config.backgroundColor = 0xFFFFFF;
        config.width = 350;
        config.condenseWhite=true;
        config.leading = 1.7;
        config.font = "Verdana";
        config.color = 0x000000;
        config.size = 11;
        config.uppercase = false;
        config.leftMargin = 25;
        config.topMargin = 25;
        config.underline=false;
        config.textAlign=TextAlign.LEFT;

        return createText(config);
    }

    public static function createTitleText(text:String):Sprite
    {
        config.text=text;
        config.backgroundColor = AppModel.getInstance().bookVO.themeColor;
        config.width = 370;
        config.condenseWhite=true;
        config.leading = 1.9;
        config.font = "Futura Std Medium Condensed";
        config.color = AppModel.getInstance().bookVO.fontColor;
        config.size = 46;
        config.uppercase = true;
        config.leftMargin = 15;
        config.topMargin = 20;
        config.underline=false;
        config.textAlign=TextAlign.LEFT;

        return createText(config);
    }

    public static function createLinkText(label:String):Sprite
    {
        config.text=label;
        config.backgroundColor = AppModel.getInstance().bookVO.themeColor;
        config.width = 170;
        config.leading = 1.7;
        config.font = "Verdana";
        config.color = AppModel.getInstance().bookVO.fontColor;
        config.size = 11;
        config.uppercase = false;
        config.leftMargin = 10;
        config.topMargin = 10;
        config.underline = true;
        config.textAlign=TextAlign.LEFT;

        return createText(config);
    }

    public static function createPageNumber(text:String):Sprite
    {
        config.text=text;
        config.backgroundColor = null;
        config.width = 30;
        config.leading = 1.7;
        config.font = "Verdana";
        config.color = AppModel.getInstance().bookVO.themeColor;
        config.size = 12;
        config.uppercase = false;
        config.leftMargin = 0;
        config.topMargin = 0;
        config.underline = false;
        config.textAlign=TextAlign.LEFT;

        return createText(config);
    }

    public static function createTitleLabel(text:String,width=100):Sprite
    {
        config.text=text;
        config.backgroundColor = 0x111111;
        config.leading = 1.3;
        config.font = "Verdana";
        config.color = 0xFFFFFF;
        config.size = 9;
        config.uppercase = false;
        config.leftMargin = 5;
        config.topMargin = 2;
        config.underline = false;
        config.width = width-config.leftMargin*2;
        config.textAlign=TextAlign.LEFT;

        return createText(config);
    }

    public static function createPreloaderText(text:String):Sprite
    {
        config.text=text;
        config.backgroundColor = 0xFFFFFF;
        config.leading = 1.5;
        config.font = "Verdana";
        config.color = 0x000000;
        config.size = 9;
        config.uppercase = false;
        config.leftMargin = 5;
        config.topMargin = 5;
        config.underline = false;
        config.width = 200;
        config.textAlign=TextAlign.CENTER;

        return createText(config);
    }
}
}
