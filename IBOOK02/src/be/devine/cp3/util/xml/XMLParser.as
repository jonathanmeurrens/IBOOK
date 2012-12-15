package be.devine.cp3.util.xml
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.queue.Queue;
import be.devine.cp3.util.queue.tasks.URLLoaderTask;

import flash.events.Event;

public class XMLParser
{
    protected var _appModel:AppModel;
    private var _queueLoader:Queue;

    public function XMLParser()
    {
        this._appModel = AppModel.getInstance();
    }

    public function parse(url:String):void
    {
        _queueLoader = new Queue();
        var xmlTask:URLLoaderTask = new URLLoaderTask(url);
        xmlTask.addEventListener(Event.COMPLETE, xmlLoadingDoneHandler);
        _queueLoader.add(xmlTask);
        _queueLoader.start();
    }

    private function xmlLoadingDoneHandler(e:Event):void
    {
        parseXML(XML(URLLoaderTask(e.target).data));
    }

    protected function parseXML(xml:XML):void
    {
        // ** child classes override this method for their own implementation depending on XML content
    }
}
}
