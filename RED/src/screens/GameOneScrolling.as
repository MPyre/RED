package screens
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class GameOneScrolling extends Sprite
	{
		public static var container:Sprite;
		protected var bg:MovieClip;
		protected var moveX:Number = 0;
		protected var moveY:Number = 0;
		
		public var count:Number = 0;
		public var speed:Number = 8;
		public var spriteLocX:Number = 0;
		public var spriteLocY:Number = 0;
		public var checkpoint:Number = 0;
		
		public function GameOneScrolling()
		{

		}
		 public function initialize():void
		{			
			container = new Sprite();
			this.addChild(container);
			
			var bg:MovieClip = new levelThree();
			container.addChild(bg);			
			
			var bg2:MovieClip = new levelThree();
			container.addChild(bg2);	
			
			var bg3:MovieClip = new levelThree();
			container.addChild(bg3);
			
			var bg4:MovieClip = new levelTwoC();
			container.addChild(bg4);
			
			var bg5:MovieClip = new levelTwoB();
			container.addChild(bg5);
			
			var bg6:MovieClip = new levelTwoA();
			container.addChild(bg6);
			
			var bg7:MovieClip = new levelOne();
			container.addChild(bg7);	
			
			var bg8:MovieClip = new levelOne();
			container.addChild(bg8);
			
			var bg9:MovieClip = new levelOne();
			container.addChild(bg9);
			
			bg2.y = bg.y + bg.height;
			bg3.y = bg2.y + bg.height;
			bg4.y = bg3.y + bg.height;
			bg5.y = bg4.y + bg.height;
			bg6.y = bg5.y + bg.height;
			bg7.y = bg6.y + bg.height;
			bg8.y = bg7.y + bg.height;
			bg9.y = bg8.y + bg.height;

			
			trace("initialize on Scrolling");
			update();
		}
		public function update():void
		{
			trace("count: ",count);
			
			if(container.y + container.height <= stage.stageHeight)
			{
				container.y = 0;
			}
			
			if(container.y >= 0) 
			{
				container.y = stage.stageHeight - container.height;
			}
			
			if(checkpoint != 5)
			{
			count++;
			container.y +=  speed;
			}
			if(checkpoint == 5)
			{
			container.y = container.y;
			}
			changeAlpha();
		}
		
		private function changeAlpha():void
		{
			// TODO Auto Generated method stub
			trace("container y: ",container.y);
			trace("alpha: ",container.alpha);

			if(container.y >= -6000)
			{
				if(checkpoint == 0)
				{
					container.alpha = count * 0.09;
				}
				if(container.y >= -4850)
				{
					if(checkpoint == 0 || checkpoint == 1)
					{
						if (checkpoint == 0)
						{
							count = 0;
							checkpoint = 1;
						}
						if(checkpoint == 1)
						{
							container.alpha = 1 - (count/9);
						}
					}
					if(container.y >= -4000)
					{
						if(checkpoint == 1 || checkpoint == 2)
						{
							if(checkpoint == 1)
							{
								count = 0;
								checkpoint = 2;
							}
							if(checkpoint == 2)
							{
							container.alpha = count *0.09;
							}
						}
						if(container.y >= -2500)
						{
							if(checkpoint == 2 || checkpoint == 3)
							{
								if(checkpoint == 2)
								{
									count = 0;
									checkpoint = 3;
								}
								if(checkpoint == 3)
								{
									container.alpha = 1 - (count / 9);
								}
							}
							if(container.y >= -1650)
								if(checkpoint == 3 || checkpoint == 4)
								{
									if(checkpoint == 3)
									{
										count = 0;
										checkpoint = 4;
									}
									if(checkpoint == 4)
									{
										container.alpha = count*0.09;
									}
								}
							if(container.y >= -50)
							{
								checkpoint = 5;
							}
						}
					}
				}
			}
		}
	}
}