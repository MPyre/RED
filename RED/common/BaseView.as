package 
{
	import flash.display.Sprite;
	import flash.events.Event;

	
	public class BaseView extends Sprite
	{
		public function BaseView()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		protected function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function initialize():void
		{
			trace("initialize on BaseView")

		}
		public function update():void
		{
			
		}
		public function addListeners():void
		{
			
		}
		public function removeListeners():void
		{
			
		}
		public function activate():void
		{
		
		}
		public function deactivate():void
		{
		
		}
		public function destroy():void
		{
		
		}
	}
}