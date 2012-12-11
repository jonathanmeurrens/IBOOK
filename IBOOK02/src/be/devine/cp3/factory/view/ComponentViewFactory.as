/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 03/12/12
 * Time: 12:05
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.view {
import be.devine.cp3.view.components.Component;
import be.devine.cp3.view.components.buttons.NextPageBtn;
import be.devine.cp3.view.components.text.Body;
import be.devine.cp3.view.components.text.Title;
import be.devine.cp3.view.components.gallery.Gallery;
import be.devine.cp3.vo.BodyVO;
import be.devine.cp3.vo.ComponentVO;
import be.devine.cp3.vo.GalleryVO;
import be.devine.cp3.vo.LinkVO;
import be.devine.cp3.vo.TitleVO;

import starling.display.DisplayObject;

public class ComponentViewFactory
{
    public function ComponentViewFactory()
    {

    }

    public static function createFromVO(componentVO:ComponentVO):DisplayObject
    {
        if(componentVO is BodyVO)
            return new Body(componentVO as BodyVO);
        if(componentVO is TitleVO)
            return new Title(componentVO as TitleVO);
        if(componentVO is GalleryVO)
            return new Gallery(componentVO as GalleryVO);
        if(componentVO is LinkVO)
            return new NextPageBtn(componentVO as LinkVO);

        return null;
    }
}
}
