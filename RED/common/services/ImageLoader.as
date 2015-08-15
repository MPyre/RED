package services
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	
	
	public class ImageLoader extends EventDispatcher
	{
		public static const SUCCESS:String = "success";
		public static const FAIL:String = "fail";
		
		private var loader:Loader;
		private var req:URLRequest;
		public var path:String = "";
		
		private var bmd:BitmapData;
		
		public function ImageLoader()
		{
			
		}
		public function addListeners():void
		{
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);	
		}
		public function removeListeners():void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);			
		}
		public function load(e:String):void
		{
			path = e;
			
			if(loader == null)
			{
				loader = new Loader();
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
			//trace("bytes loaded:", event.bytesLoaded);
			//trace("bytes total:", event.bytesTotal);
			//trace("bytes percentage:", ((event.bytesLoaded/event.bytesTotal)*100), "%");
		}
		
		protected function onComplete(event:Event):void
		{
			// TODO Auto-generated method stub
			bmd = new BitmapData(
			event.currentTarget.content.width,
			event.currentTarget.content.height,
			true, 0x000000);
			bmd.draw(event.currentTarget.content);
			
/*			var bmp:Bitmap = event.currentTarget.content as Bitmap;
			bmd = bmp.bitmapData;
			bmp = null*/
			
			bmd = event.currentTarget.content as BitmapData;
			
			dispatchEvent(new Event(SUCCESS));
		}
		public function getData():BitmapData
		{
			return bmd;
		}
	}
}