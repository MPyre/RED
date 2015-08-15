package screens
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class GameScreenOne extends Screens
	{
		protected var start:MovieClip;
		protected var game:MovieClip;
		protected var click:Number;
		public function GameScreenOne(root:ApplicationView)
		{
			super(root);
		}
		override public function initialize():void
		{			
			click = 0;
			start = new MovieClip;
			this.addChild(start);
			addStart();			
			trace("initialize on GameScreenOne");
		}
		
		private function addStart():void
		{
			game = new gameOneButton;
			game.name = "startgame";
			start.addChild(game);
			
			game.x = 460;
			game.y = 341;
			
			game.addEventListener(MouseEvent.CLICK, onClick);
			// TODO Auto Generated method stub
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "startgame" :
/*					if(click == 0)
					{*/
					var gameOne:GameOne = new GameOne(root);
					this.addChild(gameOne);
					gameOne.initialize();
					start.removeChild(game);
	/*				}
					if(click >= 1)
					{
					gameOne.restart();
					}
					click++*/
					break;
			}
		}
	}
}