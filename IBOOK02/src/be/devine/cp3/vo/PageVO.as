/**
 * Created with IntelliJ IDEA.
 * User: Jonathan
 * Date: 21/11/12
 * Time: 21:16
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo
{
public class PageVO
{
    public var title:String;
    public var body:String;
    public var background_image:String;
    public var gallery:Vector.<ImageVO>=new Vector.<ImageVO>();
    public var link:uint;

    public function PageVO()
    {

    }
}
}
