package
{

	import flash.utils.Dictionary;
	
	import screens.ArcadeScreen;
	import screens.ChapterSelectScreen;
	import screens.ContinueScreen;
	import screens.CreditScreen;
	import screens.CutSceneOne;
	import screens.CutSceneThree;
	import screens.CutSceneTwo;
	import screens.GameScreenOne;
	import screens.GameScreenTwo;
	import screens.HighscoreScreen;
	import screens.OptionScreen;
	import screens.StartScreen;
	import screens.TrophyScreen;
	
	public class ApplicationView extends BaseView
	{
		private var dic:Dictionary = new Dictionary();
		private var currScreen:Screens;
		private var prevScreen:Screens;
		
		
		
		public function ApplicationView()
		{
			super();
		}
		override public function initialize():void
		{
			
			trace("initialize on Application View!!")

			var startScreen:StartScreen = new StartScreen(this);
			this.addChild(startScreen);
			startScreen.addContent(new titleScreen());
			startScreen.initialize();
			
			var continueScreen:ContinueScreen = new ContinueScreen(this);
			this.addChild(continueScreen);
			continueScreen.addContent(new screenContinue());
			continueScreen.initialize();
			
			var chapterSelectScreen:ChapterSelectScreen = new ChapterSelectScreen(this);
			this.addChild(chapterSelectScreen);
			chapterSelectScreen.addContent(new screenChapter());
			chapterSelectScreen.initialize();
			
			var creditScreen:CreditScreen = new CreditScreen(this);
			this.addChild(creditScreen);
			creditScreen.addContent(new creditsScreen());
			creditScreen.initialize();
						
			var cutSceneOne:CutSceneOne = new CutSceneOne(this);
			this.addChild(cutSceneOne);
			cutSceneOne.addContent(new cSOne());
			cutSceneOne.initialize();

			var cutSceneTwo:CutSceneTwo = new CutSceneTwo(this);
			this.addChild(cutSceneTwo);
			cutSceneTwo.addContent(new cSTwo());
			cutSceneTwo.initialize();
			
			var cutSceneThree:CutSceneThree = new CutSceneThree(this);
			this.addChild(cutSceneThree);
			cutSceneThree.addContent(new cSThree());
			cutSceneThree.initialize();
			
			var optionScreen:OptionScreen = new OptionScreen(this);
			this.addChild(optionScreen);
			optionScreen.addContent(new screenOption());
			optionScreen.initialize();

			var arcadeScreen:ArcadeScreen = new ArcadeScreen(this);
			this.addChild(arcadeScreen);
			arcadeScreen.addContent(new screenArcade());
			arcadeScreen.initialize();
			
			var highscoreScreen:HighscoreScreen = new HighscoreScreen(this);
			this.addChild(highscoreScreen);
			highscoreScreen.addContent(new screenHighscores());
			highscoreScreen.initialize();
			
			var trophyScreen:TrophyScreen = new TrophyScreen(this);
			this.addChild(trophyScreen);
			trophyScreen.addContent(new screenTrophy());
			trophyScreen.initialize();
			
			var gameScreenOne:GameScreenOne = new GameScreenOne(this);
			this.addChild(gameScreenOne);
			gameScreenOne.addContent(new miniGameOne());
			gameScreenOne.initialize();
			
			var gameScreenTwo:GameScreenTwo = new GameScreenTwo(this);
			this.addChild(gameScreenTwo);
			gameScreenTwo.addContent(new miniGameTwo());
			gameScreenTwo.initialize();
			
/*			var gameScreenThree:GameScreenThree = new GameScreenTree(this);
			this.addChild(gameScreenThree);
			gameScreenThree.addContent(new miniGameThree());
			gameScreenThree.initialize();*/
			
			

			
			startScreen.name = "startscreen";
			optionScreen.name = "optionscreen";
			cutSceneOne.name = "cutsceneone";
			cutSceneTwo.name = "cutscenetwo";
			cutSceneThree.name = "cutscenethree";			
			creditScreen.name = "creditscreen";
			arcadeScreen.name = "arcadescreen";
			highscoreScreen.name = "highscorescreen";
			trophyScreen.name = "trophyscreen";
			gameScreenOne.name = "gamescreenone";
			gameScreenTwo.name = "gamescreentwo";
			continueScreen.name = "continuescreen";
			chapterSelectScreen.name = "chapterselectscreen";
			
			
			dic[startScreen.name] = startScreen;
			dic[optionScreen.name] = optionScreen;
			dic[cutSceneOne.name] = cutSceneOne;
			dic[cutSceneTwo.name] = cutSceneTwo;
			dic[cutSceneThree.name] = cutSceneThree;
			dic[creditScreen.name] = creditScreen;
			dic[arcadeScreen.name] = arcadeScreen;
			dic[highscoreScreen.name] = highscoreScreen;
			dic[trophyScreen.name] = trophyScreen;
			dic[gameScreenOne.name] = gameScreenOne;
			dic[gameScreenTwo.name] = gameScreenTwo;
			dic[continueScreen.name] = continueScreen;
			dic[chapterSelectScreen.name] = chapterSelectScreen;

			
			getScene("startscreen");
		}
		public function getScene(str:String):Screens
		{
			if(currScreen!=null) prevScreen = currScreen;
			
			for(var s:String in dic)
			{
				if(s == str)
				{
					dic[s].activate();
					currScreen = dic[s];
				}
				else
				{
					dic[s].deactivate();
				}
			}
			return currScreen;
		}
	}
}