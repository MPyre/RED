package screens
{
	import flash.events.MouseEvent;

	public class GameScreenTwo extends Screens
	{
		public function GameScreenTwo(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{			
			mcContent.btnOption.addEventListener(MouseEvent.CLICK, onClick);
			
			trace("initialize on CutSceneTwo");
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnOption" :
					root.getScene("cutscenethree");
					break;

			}
		}
	}
}