/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 03/12/12
 * Time: 11:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo
{
public class GalleryVO extends ComponentVO
{
    private var _images:Vector.<ImageVO>;

    public function GalleryVO()
    {
        _images = new Vector.<ImageVO>();
    }

    public function get images():Vector.<ImageVO> {
        return _images;
    }

    public function set images(value:Vector.<ImageVO>):void {
        _images = value;
    }
}
}
