package screens
{
	import flash.events.MouseEvent;

	public class CutSceneOne extends Screens
	{
		public function CutSceneOne(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{			
			mcContent.btnOption.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnSkip.addEventListener(MouseEvent.CLICK, onClick);

			trace("initialize on CutSceneOne");
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
					GameOne.optionsG = false;
					root.getScene("gamescreenone");
					break;
			}
		}
		
		public function changeScene(e:String):void
		{
			root.getScene(e);
		}
	}
}