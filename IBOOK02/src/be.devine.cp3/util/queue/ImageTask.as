package be.devine.cp3.util.queue
{
import flash.display.Loader;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.net.URLRequest;

public class ImageTask extends Loader implements iTask
    {
        private var _url:String;

        public function ImageTask(url:String)
        {
            _url = url;
        }

        public function start():void
        {
            contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            load(new URLRequest(_url));
        }

        private function progressHandler(event:ProgressEvent):void
        {

        }

        public function completeHandler(e:Event):void
        {
            dispatchEvent(new Event(Event.COMPLETE));
        }
    }
}
