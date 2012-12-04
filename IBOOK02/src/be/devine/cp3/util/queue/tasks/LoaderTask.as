package be.devine.cp3.util.queue.tasks
{
import flash.display.Loader;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.net.URLRequest;

public class LoaderTask extends Loader implements IQueueTask
	{
		
		private var url:String;
		
		public function LoaderTask(url:String)
		{
			this.url = url;
		}
		
		public function start():void
		{
			contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			load(new URLRequest(url));
		}
		
		private function progressHandler(event:ProgressEvent):void
		{
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, event.bytesLoaded, event.bytesTotal));
		}
		
		private function completeHandler(event:Event):void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}