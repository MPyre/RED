package screens
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class GameOneCollision extends Sprite
	{		
		public var redContainer:MovieClip;
		public var obstacleContainer:MovieClip;
		public var red:MovieClip;
		public var obs1:MovieClip;
		public var obs2:MovieClip;
		public var obs3:MovieClip;
		
		public var moveX:Number = 0;
		public var moveY:Number = 0;
		
		public var obsSpawn:Array;
		public var obsSpaCount:Number;
		public var obsLoop:Number = 0;
		public var obsAlpha:Number = 0;
		
		public var count:Number = 0;
		public var obsSpeed:Number = 10;
		public var redSpeed:Number = 8;
		
		public var spriteLocX:Number = 0;
		public var spriteLocY:Number = 0;
		
		public function GameOneCollision()
		{
			super();
		}
		public function initialize():void
		{
			spriteLocX = stage.stageWidth*0.50;
			spriteLocY = stage.stageHeight*0.50;
			
			redContainer = new MovieClip();
			this.addChild(redContainer);
			
			obstacleContainer = new MovieClip();
			this.addChild(obstacleContainer);
			
			createRed();
			createObstacle();
			
			this.addEventListener(Event.ENTER_FRAME, update);

		}
		
		public function update(e:Event):void
		{
			if(optBool == 0 || optContainer.optBool == 0)
			{
				bgContainer.update();
				
				if(moveX>0)
				{
					if(red.x + (red.width*1.3) <= stage.stageWidth)
					{
						red.x+=redSpeed;
						if(red.x + red.width < obstacleContainer.x + obstacleContainer.width)
						{
							if(red.y + red.height < obstacleContainer.y + obstacleContainer.height)
							{
								red.x += 0;
							}
						}
					}
				}
				if(moveX<0)
				{
					if(red.x >= 0 + (red.width*1.3))
					{
						red.x-=redSpeed;
						if(red.x < obstacleContainer.x + obstacleContainer.width)
						{
							if(red.y + red.height < obstacleContainer.y + obstacleContainer.height)
							{
								red.x +=0;
							}
						}
					}
				}
				
				addRandomObstacle();
				
				if(red.hitTestObject(obs1))
				{
					if(hitTestObject(obs1) == true)
					{	
						obsAlpha += 2;
						trace("hitting");
						GameOne.bgContainer.speed = 0;
						obsSpeed = 0;
						obstacleContainer.alpha = obsAlpha * 0.09;
					}
				}
				else
				{
					bgContainer.speed = 10;
					obsSpeed = 10;
					obsAlpha = 0;
				}
			}
	
		private function createRed():void
		{
			red = new Character();
			redContainer.addChild(red);
			
			red.x = spriteLocX;
			red.y = spriteLocY + (stage.stageHeight/3);
			
			addRedControl();
		}
		
		private function createObstacle():void
		{
			obs1 = new obstacleOne();
			addChild(obs1);			
			obs2 = new obstacleTwo();
			addChild(obs2);
			obs3 = new obstacleThree();
			addChild(obs3);
		}
		
		private function randomRange(minNum:Number, maxNum:Number):Number 
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		private function addRandomObstacle():void
		{
			if(obsLoop == 0)
			{
				obstacleContainer.x = randomRange(400,750);
				obsLoop = 2;
			}
			
			if(obstacleContainer.y == 700 && obsLoop == 2)
			{
				//obstacleContainer.removeChild(obs1);
				//obstacleContainer.addChild(obs3);
				obsLoop++;
			}
			if(obsLoop%2 == 0)
			{
				obstacleContainer.y += obsSpeed;
			}
			if(obsLoop%2 == 1)
			{
				obstacleContainer.x = randomRange(400,750);
				obstacleContainer.y = 0;
				obsLoop ++;
			}
		}
		
		private function addRedControl():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onRedPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onRedRelease);
		}
		
		public function onRedPress(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					/*if(hitTestObject(obstacle) == true)
					{	
					if(red.x > obstacle.width && red.x + red.width > obstacle.x + obstacle.width)
					{
					if(red.y > obstacle.height)
					{
					moveX = 0;
					}
					}
					}
					if(red.y >= obstacle.height)
					{*/
					moveX -= 10;
					red.rotation = 0;
					//}
					break;
				case Keyboard.RIGHT:
					/*		if(hitTestObject(obstacle) == true)
					{	
					if(red.width < obstacle.x && red.y > obstacle.y + obstacle.height)
					{
					moveX = 0;
					}
					}
					else{*/
					moveX += 10;
					red.rotation = 0;
					//}
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
		
		public function onRedRelease(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					moveX = 0;
					break;
				case Keyboard.RIGHT:
					moveX = 0;
					break;
				case Keyboard.UP:
					moveY = 0;
					break;
				case Keyboard.DOWN:
					moveY = 0;
					break;
			}
		}
	}
}