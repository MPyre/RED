package screens
{
	import flash.events.MouseEvent;

	public class HighscoreScreen extends Screens
	{
		public function HighscoreScreen(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{
			mcContent.btnBack.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnOptions.addEventListener(MouseEvent.CLICK, onClick);

			trace("initialize on OptionScreen");
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnBack" :
					root.getScene("arcadescreen");
					break;
				case "btnOptions" :
					root.getScene("optionscreen");
					break;
				
			}
		}
	}
}