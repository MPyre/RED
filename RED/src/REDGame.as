package
{
	import flash.events.Event;

	
	[SWF(width="1200", height="800", frameRate="32")]
	
	public class REDGame extends BaseView
	{
		public function REDGame()
		{
			super();
		}
		override protected function init(e:Event):void
		{
			
			super.init(e);
			initialize();
		}
		override public function initialize():void
		{

			trace("initialize on game project!")
			var appView:ApplicationView = new ApplicationView();
			this.addChild(appView);
			appView.initialize();
			
		}
	}
}