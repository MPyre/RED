package
{
	import flash.display.MovieClip;

	public class Screens extends BaseView
	{
		protected var root:ApplicationView;
		protected var mcContent:MovieClip;
		
		public function Screens(root:ApplicationView)
		{
			this.root = root;
			super();
		}
		override public function initialize():void
		{
			trace("initialize on Screen!")
		}
		public function addContent(mc:MovieClip):void
		{
			mcContent = mc;
			this.addChild(mcContent);
		}
		override public function activate():void
		{
			this.visible = true;
		}
		override public function deactivate():void
		{
			this.visible = false;
		}
	}
}