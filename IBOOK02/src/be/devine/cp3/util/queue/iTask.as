package be.devine.cp3.util.queue
{
import flash.events.Event;

public interface iTask
    {
        function start():void;
        function completeHandler(e:Event):void
    }
}
