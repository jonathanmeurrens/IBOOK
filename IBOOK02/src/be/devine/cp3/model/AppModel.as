/**
 * Created with IntelliJ IDEA.
 * User: thomasverleye
 * Date: 22/11/12
 * Time: 10:25
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model {
import be.devine.cp3.vo.BookVO;
import be.devine.cp3.vo.PageVO;

import flash.events.Event;
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher{
    //##########
    //Properties
    //##########
    private var _bookVO:BookVO;

    // page
    private var _currentPageIndex:int;
    //private var _currentPage:PageVO; // TODO current page is niet nodig, de index is voldoende, AppModel herwerken

    // scrollbar
    private var _bodyScrollPosition:Number=0;

    //######
    //Events
    //######
    public static const CURRENT_PAGE_CHANGED:String = "CURRENT_PAGE_CHANGED";
    public static const BOOK_CHANGED:String ="BOOK_CHANGED";
    public static const BODY_SCROLLBAR_CHANGED:String = "BODY_SCROLLBAR_CHANGED";

    private static var instance:AppModel;

    public static function getInstance():AppModel
    {
        if(instance == null) {
            instance = new AppModel(new Enforcer());
        }
        return instance;
    }

    public function AppModel(e:Enforcer)
    {
        if(e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }
    }

    //#######
    //Methods
    //#######

    //previous & next page//

    public function goToPreviousPage():void{
        if(_currentPageIndex-1>=0)
            currentPageIndex--;
        else
            currentPageIndex=_bookVO.pages.length-1;
    }

    public function goToNextPage():void{
        if(_currentPageIndex+1<=_bookVO.pages.length-1)
            currentPageIndex++;
        else
            currentPageIndex=0;
    }

    //has previous & next page

    /*private function hasPrevious():Boolean{
        return currentPageIndex > 0;
    }

    private function hasNext():Boolean{
        return  (currentPageIndex > -1 && (currentPageIndex + 1) < _bookVO.pages.length);
    }*/

    //#################
    //getters & setters
    //#################

    //bookVO

    public function get bookVO():BookVO {
        return _bookVO;
    }

    public function set bookVO(value:BookVO):void {
        if (_bookVO = value)
        {
            _bookVO = value;
            dispatchEvent(new Event(BOOK_CHANGED));
        }
    }

    //currentIndex

    public function get currentPageIndex():int
    {
        return _currentPageIndex;
    }

    public function set currentPageIndex(value:int):void {

        if(value!=_currentPageIndex && value>=0 && value<_bookVO.pages.length)
        {
            trace("[AppModel] page changed to "+value);
            _currentPageIndex = value;
            dispatchEvent(new Event(AppModel.CURRENT_PAGE_CHANGED));
        }
    }

    //currentPage

   /* public function get currentPage():PageVO {
        return _currentPage;
    }

    public function set currentPage(value:PageVO):void {
        if(_currentPage != value)
        {
            _currentPage = value;
            _currentPageIndex = _bookVO.pages.indexOf(_currentPage);
            dispatchEvent(new Event(CURRENT_PAGE_CHANGED));
        }
    }*/

    // body text scroll position

    public function set bodyScrollPosition(value:Number):void
    {
        if(value!=_bodyScrollPosition)
        {
            _bodyScrollPosition = value;
        }
    }

    public function get bodyScrollPosition():Number
    {
        return _bodyScrollPosition;
    }
}
}

internal class Enforcer{};
