package be.devine.cp3.util.queue.tasks
{
import flash.events.IEventDispatcher;

public interface IQueueTask extends IEventDispatcher
	{
		function start():void;
	}
}