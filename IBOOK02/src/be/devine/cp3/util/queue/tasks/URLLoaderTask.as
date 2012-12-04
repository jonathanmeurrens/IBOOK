package be.devine.cp3.util.queue.tasks
{
import flash.net.URLLoader;
import flash.net.URLRequest;

public class URLLoaderTask extends URLLoader implements IQueueTask
	{
		
		private var url:String;
		
		public function URLLoaderTask(url:String)
		{
			this.url = url;
		}
		
		public function start():void
		{
			load(new URLRequest(url));
		}
	}
}