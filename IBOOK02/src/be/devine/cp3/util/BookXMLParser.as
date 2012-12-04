package be.devine.cp3.util
{
import be.devine.cp3.factory.vo.BookVOFactory;

public class BookXMLParser extends XMLParser
{
    public function BookXMLParser()
    {
        super();
    }

    override protected function parseXML(bookXML:XML):void
    {
        _appModel.bookVO = BookVOFactory.createBookVOFromXML(bookXML);
        /*var bookVO:BookVO = new BookVO();
        bookVO.title=book.title;
        bookVO.themeColor = Number("0x"+book.@themeColor);
        bookVO.fontColor = Number("0x"+book.@fontColor);

        for(var i:uint = 0; i<book.pages.page.length();i++)
        {
            var pageVO:PageVO = PageVOFactory.createPageVOFromXML(book.pages.page[i]);
            bookVO.pages.push(pageVO);
        }*/

    }

}
}
