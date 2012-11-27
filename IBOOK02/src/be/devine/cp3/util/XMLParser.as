package be.devine.cp3.util
{
import be.devine.cp3.model.AppModel;
import be.devine.cp3.util.queue.QueueLoader;
import be.devine.cp3.util.queue.XMLTask;

import flash.events.Event;

public class XMLParser
{
    protected var _appModel:AppModel;
    private var _queueLoader:QueueLoader;

    public function XMLParser()
    {
        this._appModel = AppModel.getInstance();
    }

    public function parse(url:String):void
    {
        _queueLoader = new QueueLoader();
        var xmlTask:XMLTask = new XMLTask(url);
        xmlTask.addEventListener(Event.COMPLETE, xmlLoadingDoneHandler);
        _queueLoader.add(xmlTask);
        _queueLoader.start();
    }

    private function xmlLoadingDoneHandler(e:Event):void
    {
        trace("[XMLParser] parsing");
        parseXML(XMLTask(e.target).xml);
    }

    protected function parseXML(xml:XML):void
    {
        // ** child classes override this method for their own implementation depending on XML content
    }
}
}
