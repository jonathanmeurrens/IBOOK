/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 20/11/12
 * Time: 16:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.BookXMLParser;
import be.devine.cp3.view.Book;
import be.devine.cp3.view.Timeline;

import flash.ui.Keyboard;


import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;

public class Application extends Sprite
{
    private var _appModel:AppModel;

    public function Application()
    {
        _appModel = AppModel.getInstance();

        // start loading the books content as XML and parse it, data stored in appModel
        var bookXMLParser:BookXMLParser = new BookXMLParser();
        bookXMLParser.parse("assets/book.xml");

        var book:Book = new Book();
        addChild(book);

        var timeline:Timeline = new Timeline();
        addChild(timeline);

        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(e:Event):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyboardHandler);
    }

    private function keyboardHandler(event:KeyboardEvent):void
    {
        var key:uint = event.keyCode;
        switch (key) {
            case Keyboard.LEFT :
            case Keyboard.UP:
                _appModel.goToPreviousPage();
                break;
            case Keyboard.RIGHT :
            case Keyboard.DOWN:
                _appModel.goToNextPage();
                break;
        }
    }
}
}
