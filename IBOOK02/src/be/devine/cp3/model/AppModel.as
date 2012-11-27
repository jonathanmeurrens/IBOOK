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

    private var _currentPageIndex:uint;
    private var _currentPage:PageVO;
    private var _appWidth:uint;
    private var _appHeigth:uint;

    //######
    //Events
    //######
    public static const CURRENT_PAGE_CHANGED:String = "CURRENT_PAGE_CHANGED";
    public static const BOOK_CHANGED:String ="BOOK_CHANGED";

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

    public function previousPage():void{
        if(hasPrevious)
        {
            currentPage = _bookVO.pages[currentPageIndex-1];
        }
    }

    public function nextPage():void{
        if(hasNext)
        {
            currentPage = _bookVO.pages[currentPageIndex+1];
        }
    }

    //has previous & next page

    private function hasPrevious():Boolean{
        var index:int = currentPageIndex;
        return index > 0;
    }

    private function hasNext():Boolean{
        var index:int = currentPageIndex;
        return  (index > -1 && (index + 1) < _bookVO.pages.length);
    }

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

    public function get currentPageIndex():uint {
        if(_bookVO && _currentPage)
        {
            return _bookVO.pages.indexOf(_currentPage);
        }
        return -1;
    }

    public function set currentPageIndex(value:uint):void {
        //De index is manipuleerbaar voor de TOC & Timeline
        if (_currentPageIndex != value && value > -1 && value < _bookVO.pages.length)
        {
            _currentPageIndex = value;
            currentPage = _bookVO.pages[_currentPageIndex];
        }
    }

    //currentPage

    public function get currentPage():PageVO {
        return _currentPage;
    }

    public function set currentPage(value:PageVO):void {
        if(_currentPage != value)
        {
            _currentPage = value;
            _currentPageIndex = _bookVO.pages.indexOf(_currentPage);
            dispatchEvent(new Event(CURRENT_PAGE_CHANGED));
        }
    }
}
}

internal class Enforcer{};
