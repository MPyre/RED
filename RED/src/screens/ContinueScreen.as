package screens
{
	import flash.events.MouseEvent;

	public class ContinueScreen extends Screens
	{
		public function ContinueScreen(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{			
			mcContent.btnBack.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnCSelect.addEventListener(MouseEvent.CLICK, onClick);

			
			trace("initialize on ContinueScreen");
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
				case "btnCSelect" :
					root.getScene("chapterselectscreen");
					break;
				
			}
		}
	}
}