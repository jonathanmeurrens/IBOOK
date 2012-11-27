/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 20/11/12
 * Time: 16:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import be.devine.cp3.util.BookXMLParser;
import be.devine.cp3.view.Book;

import starling.core.Starling;

import starling.display.Sprite;

public class Application extends Sprite
{
    public function Application()
    {
        // start loading the books content as XML and parse it, data stored in appModel
        var bookXMLParser:BookXMLParser = new BookXMLParser();
        bookXMLParser.parse("assets/book.xml");

        var book:Book = new Book();
        addChild(book);

    }
}
}
