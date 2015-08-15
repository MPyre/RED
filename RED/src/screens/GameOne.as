package screens
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	
	public class GameOne extends Sprite
	{
		private var text:TextField;	
		private var tf:TextFormat;
		protected var bgContainer:GameOneScrolling;
		protected var redContainer:MovieClip;
		protected var red:MovieClip;
		protected var moveLeft:Boolean = false;
		protected var moveRight:Boolean = false;
		
		
		//options
		protected var optContainer:Sprite;
		protected var optBut:MovieClip;	
		protected var opt:MovieClip;
		protected var optBg:MovieClip;
		protected var menuContainer:MovieClip;
		protected var menu:MovieClip;
		protected var backContainer:MovieClip;
		protected var back:MovieClip;
		public static var sfxSlider:MovieClip;
		public static var sfxBar:MovieClip;
		public static var sfxVal:Number;
		public static var optionsG:Boolean = false;
		
		protected var moveX:Number = 0;
		protected var moveY:Number = 0;
		//lives
		protected var livesArray:Array;
		protected var livesCount:Number;
		protected var livesLimit:Number;
		protected var livesContainer:MovieClip;
		protected var livesOne:MovieClip;
		protected var livesTwo:MovieClip;
		protected var livesThree:MovieClip;
		protected var hit:Number;
		//obstacle
		protected var obstacleContainer:MovieClip;
		protected var obstacle:Array;
		protected var obstacleCount:Number;	
		protected var obstacleLimit:Number;	
		protected var obstacleY:Array;
		protected var obsAlpha:Number;
		protected var obs1:MovieClip;
		protected var obs2:MovieClip;
		protected var obs3:MovieClip;
		
		public var count:Number = 0;
		public var obsSpeed:Number = 10;
		public var redSpeed:Number = 8;
		public var optBool:Number = 0;
		
		public static var spriteLocX:Number = 0;
		public var spriteLocY:Number = 0;
		
		private var root:ApplicationView;
		
		public function GameOne(root:ApplicationView)
		{
			this.root = root;
		}
		
		public function initialize():void
		{			
			
			text = new TextField();
			this.addChild(text);
			text.width = stage.width;
			text.height = stage.height/6;
			text.selectable = false;
			text.multiline = false;
			text.wordWrap = true;
			tf = new TextFormat();
			tf.size = 100;
			tf.align = "center";
			
			text.setTextFormat(tf);
			
			spriteLocX = stage.stageWidth*0.50;
			spriteLocY = stage.stageHeight*0.50;
			
			obstacleCount = 0;
			obstacleLimit = 5;
			livesCount = 0;
			livesLimit = 2
			hit = 0;
			bgContainer = new GameOneScrolling();
			this.addChild(bgContainer);
			bgContainer.initialize();
			
			redContainer = new MovieClip;
			this.addChild(redContainer);
			
			obstacleContainer = new MovieClip;
			this.addChild(obstacleContainer);
			
			optBut = new MovieClip;
			this.addChild(optBut);
			
			optContainer = new MovieClip;
			this.addChild(optContainer);
			
			optBg = new bgoptions();
			menuContainer = new MovieClip;
			backContainer = new MovieClip;
			sfxSlider = new MovieClip;
			sfxBar = new MovieClip;
			
			livesContainer = new MovieClip;
			this.addChild(livesContainer);
			
			livesArray = new Array();
			
			createRed();
			createLives();
			createObstacle();
			createButton();
			
			trace("Initialize on GameOne");
			
			this.addEventListener(Event.ENTER_FRAME, update);
			
			sfxSlider.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownSlider);
			sfxBar.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBar);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);	
		}
		
		private function createObstacle():void
		{
			obstacle = new Array();
			obstacleY = new Array();
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
			
			while(obstacleCount <= obstacleLimit)
			{
				if(obstacleCount == 0)
				{ 
					obstacle[obstacleCount] = obs1;
					obstacle[obstacleCount].x = randomRange(200,750);
					obstacle[obstacleCount].y = randomRange(0, -899);
					obstacleY[obstacleCount] = -obstacle[obstacleCount].y
				}
				if(obstacleCount == 1)
				{ 
					obstacle[obstacleCount] = obs2;
					obstacle[obstacleCount].x = randomRange(200,750);
					obstacle[obstacleCount].y = randomRange(-1100, -1699);
					obstacleY[obstacleCount] = -obstacle[obstacleCount].y
				}
				if(obstacleCount == 2)
				{ 
					obstacle[obstacleCount] = obs3;
					obstacle[obstacleCount].x = randomRange(200,750);
					obstacle[obstacleCount].y = randomRange(-2000, -2899);
					obstacleY[obstacleCount] = -obstacle[obstacleCount].y
				}
				if(obstacleCount == 3)
				{ 
					obstacle[obstacleCount] = obs4;
					obstacle[obstacleCount].x = randomRange(200,750);
					obstacle[obstacleCount].y = randomRange(-3100, -3899);
					obstacleY[obstacleCount] = -obstacle[obstacleCount].y
				}
				if(obstacleCount == 4)
				{ 
					obstacle[obstacleCount] = obs5;
					obstacle[obstacleCount].x = randomRange(200,750);
					obstacle[obstacleCount].y = randomRange(-4100, -4899);
					obstacleY[obstacleCount] = -obstacle[obstacleCount].y
				}
				if(obstacleCount == 5)
				{ 
					obstacle[obstacleCount] = obs6;
					obstacle[obstacleCount].x = randomRange(200,750);
					obstacle[obstacleCount].y = randomRange(-5100, -5600);
					obstacleY[obstacleCount] = -obstacle[obstacleCount].y
				}
				trace("random range:", obstacle[obstacleCount].x, obstacle[obstacleCount].y);
				obstacleCount++;
			}
			obstacleCount = 0;
		}
		
		private function createLives():void
		{
			var livesText:MovieClip = new textLives();
			livesContainer.addChild(livesText);
			livesText.x = 125;
			livesText.y = 20;
			livesOne = new displayLives();
			livesTwo = new displayLives();
			livesThree = new displayLives();
		}
		
		private function createRed():void
		{
			red = new Character();
			redContainer.addChild(red);
			
			red.x = spriteLocX;
			red.y = spriteLocY + (stage.stageHeight/3);
			
			addRedControl();
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
			
			sfxSlider = new optSfxSlider;
			sfxSlider.y = 267;
			sfxBar = new optSfx;
			sfxBar.x = 220;
			sfxBar.y = 270;
		}
		
		public function update(e:Event):void
		{
			if(optBool == 0)
			{
				bgContainer.update();
				//movement
				if(moveX>0)
				{
					if(red.x + (red.width*1.3) <= stage.stageWidth)
					{
						red.x+=redSpeed;
					}
				}
				if(moveX<0)
				{
					if(red.x >= 0 + (red.width*1.3))
					{
						red.x-=redSpeed;
					}
				}
				
				//lives
				if(livesCount == 0)
				{
					if(hit == 0)
					{
						livesCount = 1;
						livesContainer.addChild(livesOne);
						livesArray[livesCount] = livesOne;
						livesArray[livesCount].y = 70;
						livesArray[livesCount].x = 45.25;
					}
					if(hit == 3)
					{
						livesCount = 4;
						livesContainer.removeChild(livesOne);
					}
				}
				if(livesCount == 1)
				{
					livesContainer.addChild(livesTwo);
					livesArray[livesCount] = livesTwo;
					livesArray[livesCount].y = 70;
					livesArray[livesCount].x = livesTwo.width + 45.25 + 8.6;
					if(hit == 0)
					{
						livesCount = 2;
					}
					if(hit == 2)
					{
						livesCount = 0;
						livesContainer.removeChild(livesTwo);
					}	
				}
				if(livesCount == 2)
				{
					livesContainer.addChild(livesThree);
					livesArray[livesCount] = livesThree;
					livesArray[livesCount].y = 70;
					livesArray[livesCount].x = (livesThree.width * 2) + 45.25  + (8.6 * 2);
					if(hit == 1)
					{
						livesCount = 1;
						livesContainer.removeChild(livesThree);
					}
				}		
				if(livesCount == 4)
				{
					//gameover
					red.stop();
					//optBool = 1;
				}
				
				//obstacles
				if(red.hitTestObject(obstacle[obstacleCount]) == true && hit == 0)
				{	
					trace("hitting");
					bgContainer.speed = 0;
					obsSpeed = 0;
					hit = 1;
					if(obstacleCount != 5)
					{
						obstacleCount++;
					}
				}
				if(red.hitTestObject(obstacle[obstacleCount]) == true && hit == 1)
				{	
					trace("hitting");
					bgContainer.speed = 0;
					obsSpeed = 0;
					hit = 2;
					if(obstacleCount != 5)
					{
						obstacleCount++;
					}				
				}
				if(red.hitTestObject(obstacle[obstacleCount]) == true && hit == 2)
				{	
					trace("hitting");
					bgContainer.speed = 0;
					obsSpeed = 0;
					hit = 3;
					if(obstacleCount != 5)
					{
						obstacleCount++;
					}				
				}
				if(obstacleContainer.y >= obstacleY[obstacleCount]+700 && obstacleCount != 5)
				{
					obstacleCount++;
				}
				else
				{
					bgContainer.speed = 10;
					obsSpeed = 10;
				}
				
				obstacleContainer.y += obsSpeed;
				//obstacle.shift();
				trace("obs",obstacleContainer.y);
				trace("red",red.y);
				trace("red.y",redContainer.y);
			}		
			if(optBool == 1)
			{
				if(optionsG == true && GlobalVariable.optionsS == false)
				{
				sfxVal = Math.round((sfxSlider.x-GlobalVariable.startpos) *.142);

				text.text = sfxVal.toString();
				text.setTextFormat(tf);
				this.addChild(text);
				}
				if(optionsG == false && GlobalVariable.optionsS == true)
				{
					sfxVal = GlobalVariable.diff;
					sfxSlider.x = GlobalVariable.endpos;
					//trace(" game",sfxVal, " ", sfxSlider.x, "os", OptionScreen.diff, OptionScreen.endpos);
				}
			}
		}
		
		private function addRedControl():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onRedPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onRedRelease);
		}
		
		protected function onRedPress(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					moveX -= 10;
					red.rotation = 0;
					moveLeft = true;
					break;
				case Keyboard.RIGHT:
					moveX += 10;
					red.rotation = 0;
					moveRight = true;
					break;
				case Keyboard.UP:
					moveY = -redSpeed;
					red.rotation = 0;
					break;
				case Keyboard.DOWN:
					moveY = redSpeed;
					red.rotation = 0;
					break;
			}
		}
		
		protected function onRedRelease(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					moveX = 0;
					moveLeft = false;
					break;
				case Keyboard.RIGHT:
					moveX = 0;
					moveRight = false;
					break;
				case Keyboard.UP:
					moveY = 0;
					break;
				case Keyboard.DOWN:
					moveY = 0;
					break;
			}
		}
		
		protected function onClick(e:MouseEvent):void
		{	
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			//throw new Error(btnName);
			switch(btnName)
			{
				
				case "menuButton" :
					optContainer.removeChild(optBg);
					optContainer.removeChild(menuContainer);
					optContainer.removeChild(backContainer);
					optContainer.removeChild(sfxBar);
					optContainer.removeChild(sfxSlider);
					GlobalVariable.diff = sfxVal;
					GlobalVariable.endpos = sfxSlider.x;
					optionsG = false;
					GlobalVariable.endpos = sfxSlider.x;

					this.removeChild(text);
					optBut.addChild(opt);
					root.getScene("startscreen");
					//(Object).parent.changeScene("");
					trace("back to menu");
					break;
				case "optionsButton" :
					sfxSlider.x = GlobalVariable.endpos;
					optBool = 1;
					optContainer.addChild(optBg);
					optContainer.addChild(menuContainer);
					optContainer.addChild(backContainer);
					optContainer.addChild(sfxBar);
					optContainer.addChild(sfxSlider);
					optionsG = true;
					
					optBut.removeChild(opt);
					red.stop();
					trace("game options");
					break;
				case "backButton" :
					optBool = 0;
					optContainer.removeChild(optBg);
					optContainer.removeChild(menuContainer);
					optContainer.removeChild(backContainer);
					optContainer.removeChild(sfxBar);
					optContainer.removeChild(sfxSlider);
					this.removeChild(text);
					GlobalVariable.endpos = sfxSlider.x;
					optionsG = false;
					
					optBut.addChild(opt);
					red.play();
					trace("back to game");
					break;
			}
		}
		protected function onMouseDownSlider(e:MouseEvent):void
		{
			e.currentTarget.startDrag(false, new Rectangle(sfxBar.x,
				sfxBar.y + ((sfxBar.height - sfxSlider.height) *0.50), 
				sfxBar.width - sfxSlider.width, 0 ));
		}
		
		protected function onMouseDownBar(e:MouseEvent):void
		{
			sfxSlider.x = mouseX - (sfxSlider.width / 2);

			sfxSlider.startDrag(false, new Rectangle(sfxBar.x,
				sfxBar.y + ((sfxBar.height - sfxSlider.height) *0.50), 
				sfxBar.width - sfxSlider.width, 0 ));
		}
		protected function onMouseUp(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
		}
		
	}
}