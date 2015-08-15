package screens
{
	import flash.events.MouseEvent;

	public class CreditScreen extends Screens
	{
		public function CreditScreen(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{
			mcContent.btnBack.addEventListener(MouseEvent.CLICK, onClick);
			
			trace("initialize on CreditScreen");
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnBack" :
					root.getScene("optionscreen");
					break;
			}
		}
	}
}