/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 27/11/12
 * Time: 18:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;

import flash.events.Event;

import starling.display.Sprite;

public class Timeline extends Sprite{

    private var _appModel:AppModel;

    public function Timeline() {
        _appModel = AppModel.getInstance();
        _appModel.addEventListener(AppModel.BOOK_CHANGED, bookChangedHandler);
    }

    private function bookChangedHandler(event:Event):void {

    }
}
}
