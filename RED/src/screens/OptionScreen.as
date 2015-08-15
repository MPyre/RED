package screens
{
	//import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class OptionScreen extends Screens
	{
		public function OptionScreen(root:ApplicationView)
		{
			super(root);
		}
		private var text:TextField;	
		private var tf:TextFormat;
		private var srt:String;


		//public static var sfxPos:Number;

		override public function initialize():void
		{
			text = new TextField();
			this.addChild(text);
			text.width = stage.width;
			text.y = stage.height /6;
			text.selectable = false;
			text.multiline = false;
			text.wordWrap = true;
			tf = new TextFormat();
			tf.size = 100;
			tf.align = "center";
			
			text.setTextFormat(tf);
			
			mcContent.btnSfxSlider.x = ((mcContent.btnSfxBar.width+mcContent.btnSfxBar.x+mcContent.btnSfxSlider.width)/2)*1.065; //((stage.width-mcContent.btnSfxBar.x+mcContent.btnSfxSlider.width) / 2);  //- ((mcContent.btnSfxBar.x + mcContent.btnSfxBar.width)/2);
			mcContent.btnSfxSlider.y = mcContent.btnSfxBar.y + ((mcContent.btnSfxBar.height - mcContent.btnSfxSlider.height) *0.50);
			
			mcContent.btnSfxSlider.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownSlider);
			mcContent.btnSfxBar.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBar);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			/*mcContent.btnBgmSlider.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			mcContent.btnBgmSlider.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			mcContent.btnBgmSlider.x = mcContent.btnBgmSlider.x + ((mcContent.btnBgmSlider.width - mcContent.btnBgmSlider.width)*0.50);
			mcContent.btnBgmSlider.y = mcContent.btnBgmSlider.y + ((mcContent.btnBgmSlider.height - mcContent.btnBgmSlider.height)*0.50);
			*/
			this.addEventListener(Event.ENTER_FRAME, update);
			
			mcContent.btnMenu.addEventListener(MouseEvent.CLICK, onClick);
			mcContent.btnCredits.addEventListener(MouseEvent.CLICK, onClick);
			
			trace("initialize on OptionScreen");
		}
		private function update(e:Event):void
		{
			if(GlobalVariable.optionsS == true && GameOne.optionsG == false)
			{
			GlobalVariable.startpos = Math.round(mcContent.btnSfxBar.x);
			GlobalVariable.endpos = mcContent.btnSfxSlider.x;
			GlobalVariable.diff = Math.round((GlobalVariable.endpos-GlobalVariable.startpos) *.142);
			text.text = GlobalVariable.diff.toString();
			text.setTextFormat(tf);
			trace("...optionscreen1...");
			trace("optionsS: ", GlobalVariable.optionsS, "optionsG: ", GameOne.optionsG);
			}
			if(GlobalVariable.optionsS == false && GameOne.optionsG == true)
			{
				GlobalVariable.endpos = GameOne.sfxSlider.x;
				GlobalVariable.diff = GameOne.sfxVal;
				trace("...optionscreen2...");
				trace("optionsS: ", GlobalVariable.optionsS, "optionsG: ", GameOne.optionsG);
			}
/*			if(diff != GameOne.sfxVal)
			{
				diff = GameOne.sfxVal;
			}*/
		}
		private function onClick(e:MouseEvent):void
		{
			var btnName:String = e.currentTarget.name;
			trace("case \"", btnName, "\" :\n\tbreak;");
			switch(btnName)
			{
				case "btnMenu" :
					GlobalVariable.optionsS = false;
					root.getScene("startscreen");
					break;
				case "btnCredits" :
					root.getScene("creditscreen");
					break;
			}
		}
		private function onMouseDownSlider(e:MouseEvent):void
		{
			e.currentTarget.startDrag(false, new Rectangle(mcContent.btnSfxBar.x,
				mcContent.btnSfxBar.y + ((mcContent.btnSfxBar.height - mcContent.btnSfxSlider.height) *0.50), 
				mcContent.btnSfxBar.width - mcContent.btnSfxSlider.width, 0 ));			
		}
		private function onMouseDownBar(e:MouseEvent):void
		{
			mcContent.btnSfxSlider.x = mouseX - (mcContent.btnSfxSlider.width / 2);
			
			mcContent.btnSfxSlider.startDrag(false, new Rectangle(mcContent.btnSfxBar.x,
				mcContent.btnSfxBar.y + ((mcContent.btnSfxBar.height - mcContent.btnSfxSlider.height) *0.50), 
				mcContent.btnSfxBar.width - mcContent.btnSfxSlider.width, 0 ));		
		}
		private function onMouseUp(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
		}
	}
}