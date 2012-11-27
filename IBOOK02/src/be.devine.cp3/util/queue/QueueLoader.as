package be.devine.cp3.util.queue {

import flash.events.Event;
import flash.events.EventDispatcher;

public class QueueLoader extends EventDispatcher
    {
        public static const QUEUE_COMPLETE:String = "QUEUE_COMPLETE";

        private var _tasks:Vector.<iTask>;
        private var _completedTasks:uint=0;
        private var _currentTask:int = -1;

        public function QueueLoader()
        {
            _tasks = new Vector.<iTask>();
        }

        public function add(task:iTask):void
        {
            _tasks.push(task);
        }

        public function start():void
        {
            _currentTask=-1;
            this.currentTask = _completedTasks;
        }

        private function loadNextTask():void
        {
            var taskToLoad:iTask = _tasks[_currentTask];
            taskToLoad.start();
            currentTask++;
        }

        private function taskDoneHandler(e:Event):void
        {
            trace("task completed: "+e.target);
            this.currentTask++;
        }

        public function get currentTask():int
        {
            return _currentTask;
        }

        public function set currentTask(value:int):void
        {
            trace("trying to change currenttask from "+_currentTask + ' to '+value);
            if(_currentTask != value)
            {
                _currentTask = value;
                trace("[Queue] CurrentTask changed to "+ _currentTask + " length:"+_tasks.length);
                if(currentTask<_tasks.length)
                {
                    loadNextTask();
                }
                else
                {
                    _completedTasks = _tasks.length;
                    dispatchEvent(new Event(QueueLoader.QUEUE_COMPLETE));
                }
            }
        }

        public function get tasks():Vector.<iTask> {
            return _tasks;
        }
    }
}
