package screens
{
	import flash.events.MouseEvent;

	public class CutSceneTwo extends Screens
	{
		public function CutSceneTwo(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{			
			mcContent.btnOption.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnSkip.addEventListener(MouseEvent.CLICK, onClick);
			
			trace("initialize on CutSceneTwo");
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnOption" :
					root.getScene("optionscreen");
					break;
				case "btnSkip" :
					root.getScene("gamescreentwo");
					break;
			}
		}
	}
}