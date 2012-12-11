package be.devine.cp3.util.queue
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.queue.tasks.IQueueTask;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;

public class Queue extends EventDispatcher
	{
		
		private var tasksToExecute:Array;
		private var _finishedTasks:Array;

        private var _appModel:AppModel;

		public function get finishedTasks():Array
		{
			return _finishedTasks;
		}

		private var currentTasks:Array;
		private var isRunning:Boolean;
		private var totalTasks:uint;
		private var maxSimultaneousTasks:uint;

        //private var _trackForPageLoader:Boolean=false;
		
		public function Queue(maxSimultaneousTasks:uint = 1)
		{
           // _trackForPageLoader=trackForPageLoader;

			this.maxSimultaneousTasks = maxSimultaneousTasks;
			tasksToExecute = [];
			currentTasks = [];
			_finishedTasks = [];

            _appModel = AppModel.getInstance();
		}
		
		public function add(task:IQueueTask):void
		{
			tasksToExecute.push(task);
			totalTasks++;

            _appModel.totalToLoad++;
		}
		
		public function start():void
		{
			if(!isRunning)
			{
				isRunning = true;
				loadNext();
			}
		}
		
		private function loadNext():void
		{
			if(currentTasks.length < maxSimultaneousTasks && tasksToExecute.length > 0)
			{
				var task:IQueueTask = tasksToExecute.shift();
				task.addEventListener(Event.COMPLETE, itemCompleteHandler);
				currentTasks.push(task);
				dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, _finishedTasks.length, totalTasks));
				task.start();
				loadNext();
			}
			else if(currentTasks.length == 0 && tasksToExecute.length == 0)
			{
				isRunning = false;
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		private function itemCompleteHandler(event:Event):void
		{
			var index:int = currentTasks.indexOf(event.target);
			if(index > -1)
			{
				currentTasks.splice(index, 1);
			}
			_finishedTasks.push(event.target);

            _appModel.pagesLoadedProgress++;

			loadNext();
		}
	}
}