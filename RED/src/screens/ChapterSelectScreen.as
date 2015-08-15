package screens
{
	import flash.events.MouseEvent;

	public class ChapterSelectScreen extends Screens
	{
		public function ChapterSelectScreen(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{			
			mcContent.btnBack.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnCSOne.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnCSTwo.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnCSThree.addEventListener(MouseEvent.CLICK, onClick);
			
			trace("initialize on ChapterSelectScreen");
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnBack" :
					root.getScene("continuescreen");
					break;
				case "btnCSOne" :
					root.getScene("cutsceneone");
					break;
				case "btnCSTwo" :
					root.getScene("cutscenetwo");
					break;
				case "btnCSThree" :
					root.getScene("cutscenethree");
					break;
				
			}
		}
	}
}