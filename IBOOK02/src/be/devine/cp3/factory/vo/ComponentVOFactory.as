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
    public static function createTitleVOFromXML(elementXML:XML):TitleVO
    {
        var titleVO:TitleVO = new TitleVO();
        titleVO.hAlign = elementXML.title.@hAlign;
        titleVO.vAlign = elementXML.title.@vAlign;
        titleVO.title = elementXML.title;
        titleVO.xOffset = elementXML.title.@xOffset;
        titleVO.yOffset = elementXML.title.@yOffset;
        return titleVO;
    }

    public static function createGalleryVOFromXML(elementXML:XML):GalleryVO
    {
        var galleryVO:GalleryVO = new GalleryVO();

        for each(var imageXML:XML in elementXML.gallery.image)
        {
            galleryVO.images.push(createImageVOFromXML(imageXML));
        }
        return galleryVO;
    }

    public static function createBodyVOFromXML(elementXML:XML):BodyVO
    {
        var bodyVO:BodyVO = new BodyVO();
        bodyVO.body = elementXML.body;
        bodyVO.hAlign = elementXML.body.@hAlign;
        bodyVO.vAlign = elementXML.body.@vAlign;
        bodyVO.xOffset = elementXML.body.@xOffset;
        bodyVO.yOffset = elementXML.body.@yOffset;
        return bodyVO;
    }

    public static function createLinkVOFromXML(elementXML:XML):LinkVO
    {
        var linkVO:LinkVO = new LinkVO();
        linkVO.id = elementXML.link.@to;
        linkVO.label = elementXML.link;
        linkVO.hAlign = elementXML.link.@hAlign;
        linkVO.vAlign = elementXML.link.@vAlign;
        linkVO.xOffset = elementXML.link.@xOffset;
        linkVO.yOffset = elementXML.link.@yOffset;
        return linkVO;
    }

    public static function createImageVOFromXML(elementXML:XML):ImageVO
    {
        var imageVO:ImageVO = new ImageVO();
        imageVO.caption = elementXML.@caption;
        imageVO.url = elementXML.@url;
        return imageVO;
    }
}
}
