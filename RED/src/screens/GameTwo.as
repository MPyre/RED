package screens
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	public class GameTwo extends Sprite
	{
		//Backgrounds		
		protected var bgContainer:MovieClip;
		protected var blockContainer:MovieClip;
		protected var bg:MovieClip;
		protected var block:MovieClip;
		
		//options
		protected var optContainer:Sprite;
		protected var optBut:MovieClip;	
		protected var opt:MovieClip;
		protected var optBg:MovieClip;
		protected var menuContainer:MovieClip;
		protected var menu:MovieClip;
		protected var backContainer:MovieClip;
		protected var back:MovieClip;
		


		//obstacle
		protected var obstacleContainer:MovieClip;
		protected var obstacle:Array;
		protected var pointArea:Array;
		
		protected var obsAlpha:Number;
		protected var obs1:MovieClip;
		protected var obs2:MovieClip;
		protected var obs3:MovieClip;
		
		public var count:Number = 0;
		public var obsSpeed:Number = 10;
		public var redSpeed:Number = 8;
		public var optBool:Number = 0;
		
		public var spriteLocX:Number = 0;
		public var spriteLocY:Number = 0;
		
		private var myRoot:ApplicationView;
		
		public function GameOne(myRoot:ApplicationView)
		{
			this.myRoot = myRoot;
		}
		
		public function initialize():void
		{			
			
			spriteLocX = stage.stageWidth*0.50;
			spriteLocY = stage.stageHeight*0.50;
			

			
			obstacleContainer = new MovieClip;
			this.addChild(obstacleContainer);
			
			optBut = new MovieClip;
			this.addChild(optBut);
			
			optContainer = new MovieClip;
			this.addChild(optContainer);
			
			optBg = new bgoptions();
			menuContainer = new MovieClip;
			backContainer = new MovieClip;
			

			
			
			createRed();
			createLives();
			createObstacle();
			createButton();

			trace("Initialize on GameOne");
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function createObstacle():void
		{
			obstacle = new Array();
			obs1 = new obstacleOne();
			obs2 = new obstacleOne();
			obs3 = new obstacleTwo();
			var obs4:MovieClip = new obstacleTwo();
			var obs5:MovieClip = new obstacleThree();
			var obs6:MovieClip = new obstacleThree();
			
			obstacleContainer.addChild(obs1);
			obstacleContainer.addChild(obs2);
			obstacleContainer.addChild(obs3);
			obstacleContainer.addChild(obs4);
			obstacleContainer.addChild(obs5);
			obstacleContainer.addChild(obs6);
			
			var i:int = 0;
			var num:int = 5;
			while(i <= num)
			{

				//var index:int = int(randomRange(0,100)-1);
				//var pos:Point = pointArea[index];
				if(i == 0)
				{ 
					obstacle[i] = obs1;
					obstacle[i].x = randomRange(200,750);
					obstacle[i].y = randomRange(0, -999);
				}
				if(i == 1)
				{ 
					obstacle[i] = obs2;
					obstacle[i].x = randomRange(200,750);
					obstacle[i].y = randomRange(-1000, -1499);

				}
				if(i == 2)
				{ 
					obstacle[i] = obs3;
					obstacle[i].x = randomRange(200,750);
					obstacle[i].y = randomRange(-2000, -2999);

				}
				if(i == 3)
				{ 
					obstacle[i] = obs4;
					obstacle[i].x = randomRange(200,750);
					obstacle[i].y = randomRange(-3000, -3999);

				}
				if(i == 4)
				{ 
					obstacle[i] = obs5;
					obstacle[i].x = randomRange(200,750);
					obstacle[i].y = randomRange(-4000, -5499);

				}
				if(i == 5)
				{ 
					obstacle[i] = obs6;
					obstacle[i].x = randomRange(200,750);
					obstacle[i].y = randomRange(-5500, -6499);

				}
				
				trace("random range:", obstacle[i].x, obstacle[i].y);
				i++;
			}
		}

		private function randomRange(minNum:Number, maxNum:Number):Number 
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
			
		private function createButton():void
		{
			opt = new optButton;
			opt.name = "optionsButton";
			optBut.addChild(opt);
			
			opt.x = 980;
			opt.y = 0;
			opt.addEventListener(MouseEvent.CLICK, onClick);
			
			menuContainer = new menuButton;
			menuContainer.name = "menuButton";
			menuContainer.x = 200;
			menuContainer.y = 650;
			menuContainer.addEventListener(MouseEvent.CLICK, onClick);
			
			backContainer = new backButton;
			backContainer.name = "backButton";
			backContainer.x = 750;
			backContainer.y = 650;
			backContainer.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function update(e:Event):void
		{
			
		}
		

		protected function onClick(e:MouseEvent):void
		{	
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			//throw new Error(btnName);
			switch(btnName)
			{

				case "menuButton" :
					
					myRoot.getScene("startscreen");
					
					//(Object).parent.changeScene("");
					trace("meinu");

					break;
				case "optionsButton" :
					optBool = 1;
					optContainer.addChild(optBg);
					optContainer.addChild(menuContainer);
					optContainer.addChild(backContainer);
					optBut.removeChild(opt);
					trace("optio");
					break;
				case "backButton" :
					optBool = 0;
					optContainer.removeChild(optBg);
					optContainer.removeChild(menuContainer);
					optContainer.removeChild(backContainer);
					optBut.addChild(opt);
					trace("bakc");
					break;

			}
		}
	}
}