package be.devine.cp3.util
{
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.ImageVO;
import be.devine.cp3.vo.PageVO;

public class BookXMLParser extends XMLParser
{
    public function BookXMLParser()
    {
        super();
    }

    override protected function parseXML(book:XML):void
    {
        var bookVO:BookVO = new BookVO();
        bookVO.title=book.title;

        for(var i:uint = 0; i<book.pages.page.length();i++)
        {
            var pageVO:PageVO = new PageVO();
            pageVO.background_image = book.pages.page[i].@background;
            pageVO.title = book.pages.page[i].title;
            pageVO.body = book.pages.page[i].body;
            pageVO.link = book.pages.page[i].link;
            bookVO.pages.push(pageVO);

            for(var j:uint = 0; j<book.pages.page[i].gallery.image.length();j++)
            {
                var imageVO:ImageVO = new ImageVO();
                imageVO.caption = book.pages.page[i].gallery.image[j].@caption;
                imageVO.url = book.pages.page[i].gallery.image[j].@url;
                pageVO.gallery.push(imageVO);
            }
        }
        this._appModel.bookVO = bookVO;
    }

}
}
