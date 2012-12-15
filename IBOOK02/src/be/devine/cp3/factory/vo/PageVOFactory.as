/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 03/12/12
 * Time: 10:29
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.vo {
import be.devine.cp3.vo.PageVO;

public class PageVOFactory
{
    public static function createPageVOFromXML(pageXML:XML):PageVO
    {
        var pageVO:PageVO = new PageVO();

        pageVO.bodyVO = ComponentVOFactory.createBodyVOFromXML(pageXML);
        pageVO.titleVO = ComponentVOFactory.createTitleVOFromXML(pageXML);
        pageVO.galleryVO = ComponentVOFactory.createGalleryVOFromXML(pageXML);
        pageVO.linkVO = ComponentVOFactory.createLinkVOFromXML(pageXML);

        return pageVO;
    }
}
}
