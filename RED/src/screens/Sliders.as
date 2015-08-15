package screens
{
	import flash.events.Event;

	public class Sliders
	{
		public function Sliders()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		protected function init (e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			initialize();
		}
		
		private function initialize():void
		{
			// TODO Auto Generated method stub
			
		}
	}
}