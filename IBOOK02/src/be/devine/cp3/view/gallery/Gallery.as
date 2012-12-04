/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 29/11/12
 * Time: 14:06
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.gallery
{

import be.devine.cp3.model.GalleryModel;
import be.devine.cp3.util.AlignUtil;
import be.devine.cp3.util.queue.Queue;
import be.devine.cp3.vo.GalleryVO;
import be.devine.cp3.vo.ImageVO;

import starling.core.Starling;

import starling.display.Sprite;

public class Gallery extends Sprite
{
    private var _background:Picture;
    private var _thumbnails:Thumbnails;
    private var _currentImageIndex:uint = 0;
    private var _galleryVO:GalleryVO;

    public function Gallery(galleryVO:GalleryVO)
    {
        _galleryVO = galleryVO;
        _background = new Picture(_galleryVO.images[0].url);
        addChild(_background);

        _thumbnails = new Thumbnails(_galleryVO.images);
        addChild(_thumbnails);

        AlignUtil.alignToStage(_thumbnails,Starling.current.stage,AlignUtil.BOTTOM, AlignUtil.CENTER);
    }

    private function goToNextImage():void
    {

    }

    private function goToPrevImage():void
    {

    }

    private function set selectedImageIndex(value:uint):void
    {

    }


}
}
