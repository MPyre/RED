package screens
{
	import flash.desktop.NativeApplication;
	import flash.events.MouseEvent;

	
	public class StartScreen extends Screens
	{
		public function StartScreen(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{

			mcContent.btnNewGame.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnContinue.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnOptions.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnQuit.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnArcade.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnTrophy.addEventListener(MouseEvent.CLICK, onClick);
			
			trace("initialize on StartScreen");
			
			//mcContent.btnStart.buttonMode = true; //for movie clip buttons
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnNewGame" :
/*					var gameScreenOne:GameScreenOne = new GameScreenOne(root);
					this.addChild(gameScreenOne);
					gameScreenOne.addContent(new miniGameOne());
					gameScreenOne.initialize();*/
					root.getScene("cutsceneone");
				break;
				case "btnContinue" :
					root.getScene("continuescreen");
				break;
				case "btnOptions" :
					GlobalVariable.optionsS = true;
			
					root.getScene("optionscreen");
				break;
				case  "btnQuit" :
					NativeApplication.nativeApplication.exit();
				break;
				case "btnArcade" :
					root.getScene("arcadescreen");
				break;
				case "btnTrophy" :
					root.getScene("trophyscreen");
				break;
			}
		}
	}
}