/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 03/12/12
 * Time: 10:29
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.vo {
import be.devine.cp3.vo.BodyVO;
import be.devine.cp3.vo.ComponentVO;
import be.devine.cp3.vo.GalleryVO;
import be.devine.cp3.vo.ImageVO;
import be.devine.cp3.vo.LinkVO;
import be.devine.cp3.vo.TitleVO;

public class ComponentVOFactory
{
    public static function createComponentVOFromXML(elementXML:XML):ComponentVO
    {
        trace(elementXML.localName());
        switch(elementXML.localName())
        {
            case 'title':return createTitleVOFromXML(elementXML);
            case 'gallery':return createGalleryVOFromXML(elementXML);
            case 'body':return createBodyVOFromXML(elementXML);
            case 'link':return createLinkVOFromXML(elementXML);

        }
        return null;
    }

    public static function createTitleVOFromXML(elementXML:XML):TitleVO
    {
        var titleVO:TitleVO = new TitleVO();
        titleVO.hAlign = elementXML.@hAlign;
        titleVO.vAlign = elementXML.@vAlign;
        titleVO.title = elementXML;
        return titleVO;
    }

    public static function createGalleryVOFromXML(elementXML:XML):GalleryVO
    {
        var galleryVO:GalleryVO = new GalleryVO();

        for each(var imageXML:XML in elementXML.image)
        {
            galleryVO.images.push(createImageVOFromXML(imageXML));
        }
        return galleryVO;
    }

    public static function createBodyVOFromXML(elementXML:XML):BodyVO
    {
        var bodyVO:BodyVO = new BodyVO();
        bodyVO.body = elementXML;
        bodyVO.hAlign = elementXML.@hAlign;
        bodyVO.vAlign = elementXML.@vAlign;
        return bodyVO;
    }

    public static function createLinkVOFromXML(elementXML:XML):LinkVO
    {
        var linkVO:LinkVO = new LinkVO();
        linkVO.id = elementXML.@to;
        linkVO.label = elementXML;
        linkVO.hAlign = elementXML.@hAlign;
        linkVO.vAlign = elementXML.@vAlign;
        linkVO.xOffset = elementXML.@xOffset;
        linkVO.yOffset = elementXML.@yOffset;
        return linkVO;
    }

    public static function createImageVOFromXML(elementXML:XML):ImageVO
    {
        var imageVO:ImageVO = new ImageVO();
        imageVO.caption = elementXML.@caption;
        imageVO.url = elementXML.@url;
        return imageVO;
    }

    private static function Parserover_feature(textXML:XML):String {

        var s:String = textXML;
        s = s.replace(/(?:<br>)+/gi, '<br>');
        s = s.replace(/\n/g, '');
        //container.info_txt.htmlText = s
       return s;
    }
}
}
