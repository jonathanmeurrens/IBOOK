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

    // loader progress
    private var _pagesLoadedProgress:uint = 0;
    private var _totalToLoad:uint = 0;


    //######
    //Events
    //######
    public static const CURRENT_PAGE_CHANGED:String = "CURRENT_PAGE_CHANGED";
    public static const BOOK_CHANGED:String ="BOOK_CHANGED";
    public static const BODY_SCROLLBAR_CHANGED:String = "BODY_SCROLLBAR_CHANGED";
    public static const PROGRESS_CHANGED:String = "PROGRESS_CHANGED";

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

    //#################
    //getters & setters
    //#################

    //bookVO

    public function get bookVO():BookVO {
        return _bookVO;
    }

    public function set bookVO(value:BookVO):void {
        if (_bookVO != value)
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
            _currentPageIndex = value;
            dispatchEvent(new Event(AppModel.CURRENT_PAGE_CHANGED));
        }
    }

    // progress changed

    public function set pagesLoadedProgress(value:uint):void
    {
        if(value!=_pagesLoadedProgress)
        {
            _pagesLoadedProgress = value;
            dispatchEvent(new Event(AppModel.PROGRESS_CHANGED));
        }
    }

    public function get pagesLoadedProgress():uint
    {
        return _pagesLoadedProgress;
    }

    public function set totalToLoad(value:uint):void
    {
        _totalToLoad = value;
    }

    public function get totalToLoad():uint
    {
        return _totalToLoad;
    }
}
}

internal class Enforcer{};
