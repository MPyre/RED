package screens
{
	import flash.events.MouseEvent;

	public class ArcadeScreen extends Screens
	{
		public function ArcadeScreen(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{
			mcContent.btnBack.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnOption.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnHighscore.addEventListener(MouseEvent.CLICK, onClick);
			
			trace("initialize on ArcadeScreen");
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnBack" :
					root.getScene("startscreen");
					break;
				case "btnOption" :
					root.getScene("optionscreen");
					break;
				case "btnHighscore" :
					root.getScene("highscorescreen");
					break;
			}
		}
	}
}