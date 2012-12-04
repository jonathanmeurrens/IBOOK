/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 03/12/12
 * Time: 17:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.vo {
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.PageVO;

public class BookVOFactory
{
    public function BookVOFactory()
    {

    }

    public static function createBookVOFromXML(bookXML:XML):BookVO
    {
        var bookVO:BookVO = new BookVO();
        bookVO.title=bookXML.title;
        bookVO.themeColor = Number("0x"+bookXML.@themeColor);
        bookVO.fontColor = Number("0x"+bookXML.@fontColor);

        for(var i:uint = 0; i<bookXML.pages.page.length();i++)
        {
            var pageVO:PageVO = PageVOFactory.createPageVOFromXML(bookXML.pages.page[i]);
            bookVO.pages.push(pageVO);

            /*pageVO.titleVO = new TitleVO();
             pageVO.titleVO.title = book.pages.page[i].title;
             pageVO.titleVO.vAlign = book.pages.page[i].title.@vAlign;
             pageVO.titleVO.hAlign = book.pages.page[i].title.@hAlign;
             trace("[BookXMLParser] title:"+pageVO.titleVO.vAlign,pageVO.titleVO.hAlign);

             pageVO.bodyVO = new BodyVO();
             pageVO.bodyVO.body = book.pages.page[i].body;
             pageVO.bodyVO.vAlign = book.pages.page[i].body.@vAlign;
             pageVO.bodyVO.hAlign = book.pages.page[i].body.@hAlign;
             trace("[BookXMLParser] body:"+pageVO.bodyVO.vAlign,pageVO.bodyVO.hAlign);

             pageVO.link = book.pages.page[i].link;
             bookVO.pages.push(pageVO);

             for(var j:uint = 0; j<book.pages.page[i].gallery.image.length();j++)
             {
             var imageVO:ImageVO = new ImageVO();
             imageVO.caption = book.pages.page[i].gallery.image[j].@caption;
             imageVO.url = book.pages.page[i].gallery.image[j].@url;
             pageVO.gallery.push(imageVO);
             }*/
        }

        return bookVO;
    }
}
}
