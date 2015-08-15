package screens
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class OptionHeader extends Sprite
	{		
		public var container:Sprite;
		public var opt:MovieClip;
		public var bg:MovieClip;
		public var menuContainer:MovieClip;
		public var menu:MovieClip;
		public var backContainer:MovieClip;
		public var back:MovieClip;
		public var optBool:int = 1;
		
		
		public function OptionHeader()
		{
			
		}
		
		public function initialize():void
		{
			container = new MovieClip;
			this.addChild(container);
			container.alpha = 100;
			
			var bg:MovieClip = new bgoptions();
			container.addChild(bg);
			
			menuContainer = new MovieClip;
			this.addChild(menuContainer);
			
			backContainer = new MovieClip;
			this.addChild(backContainer);
			
			update();
			
			buttons();
		}
		
		private function buttons():void
		{
			menu = new menuButton();
			menuContainer.addChild(menu);
			menu.x = 200;
			menu.y = 650;
			menu.addEventListener(MouseEvent.CLICK, onClick);
			
			back = new backButton();
			backContainer.addChild(back);
			back.x = 750;
			back.y = 650;
			back.addEventListener(MouseEvent.CLICK, onClick);

		}
		
		public function update():void
		{
			
		}
		protected function onClick(event:MouseEvent):int
		{	
			trace("back");
			
			//container.alpha = 0;
			
			return optBool = 0;

		}
		

	}
}