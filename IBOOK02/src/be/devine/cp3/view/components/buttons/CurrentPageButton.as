/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 4/12/12
 * Time: 15:17
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.components.buttons {
import be.devine.cp3.factory.view.TextFieldFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.components.text.MyTextField;

import flash.display.BitmapData;

import flash.display.Shape;
import flash.events.Event;

import starling.display.Button;
import starling.display.Sprite;
import starling.textures.Texture;

public class CurrentPageButton extends Button{

    private var _pageNumber:Sprite;
    private var _appModel:AppModel;

    public function CurrentPageButton(){
        _appModel = AppModel.getInstance();

        // button background
        var background:Shape  = new Shape();
        background.graphics.beginFill(0xffffff);
        background.graphics.drawRect(0,0,40,30);
        background.graphics.endFill();

        var bmpData:BitmapData = new BitmapData(background.width, background.height, true, 0x0);
        bmpData.draw(background);

        super(Texture.fromBitmapData(bmpData));

        addPageNumber();

        _appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, pageIndexChanged);
    }

    private function pageIndexChanged(event:Event):void {
        this.removeChild(_pageNumber);
        addPageNumber();
    }

    private function addPageNumber():void
    {
        _pageNumber = TextFieldFactory.createPageNumber(String(_appModel.currentPageIndex+1));
        _pageNumber.y = 2;
        _pageNumber.x = 3;
        addChild(_pageNumber);
    }
}
}
