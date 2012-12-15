package be.devine.cp3.util.xml
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
    }

}
}
