package be.devine.cp3.util.queue
{
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLTask extends EventDispatcher implements iTask
    {
        private var _url:String;
        private var _xml:XML;

        public function XMLTask(url:String)
        {
            _url = url;
        }

        public function start():void
        {
            var xmlLoader:URLLoader = new URLLoader();
            xmlLoader.addEventListener(Event.COMPLETE, completeHandler);
            xmlLoader.load(new URLRequest(_url));
        }

        public function completeHandler(e:Event):void
        {
            this._xml = new XML(e.target.data);
            dispatchEvent(new Event(Event.COMPLETE));
        }

        public function get xml():XML
        {
            return _xml;
        }

        public function set xml(value:XML):void
        {
            _xml = value;
        }
}
}
