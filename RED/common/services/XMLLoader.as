package services
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class XMLLoader extends EventDispatcher
	{
		public static const SUCCESS:String = "success";
		public static const FAIL:String = "fail";
		
		private var loader:URLLoader;
		private var req:URLRequest;
		private var path:String = "";
		
		private var xml:XML;
		
		public function XMLLoader()
		{
			
		}
		public function addListeners():void
		{
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);	
		}
		public function removeListeners():void
		{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);			
		}
		public function load(e:String):void
		{
			path = e;
			
			if(loader == null)
			{
				loader = new URLLoader();
				addListeners();
			}
			
			req = new URLRequest(path);
			
			loader.load(req);
		}
		
		protected function onSecurityError(event:Event):void
		{
			// TODO Auto-generated method stub
			trace("data sec error");
			dispatchEvent(new Event(FAIL));
		}
		
		protected function onIOError(event:Event):void
		{
			// TODO Auto-generated method stub
			trace("data io error");
			dispatchEvent(new Event(FAIL));
		}
		
		protected function onProgress(event:Event):void
		{
			// TODO Auto-generated method stub
			trace("prog data");
		}
		
		protected function onComplete(event:Event):void
		{
			// TODO Auto-generated method stub
			xml = new XML(event.target.data);
			trace(xml, "SUCCESS");
			dispatchEvent(new Event(SUCCESS));
		}
		public function getData():XML
		{
			return xml;
		}
	}
}