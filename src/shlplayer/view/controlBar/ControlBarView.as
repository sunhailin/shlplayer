package shlplayer.view.controlBar 
{
	import flash.display.Sprite;
	import util.Config;
	import util.Global;
	
	/**
	 * ...
	 * @author shl
	 */
	public class ControlBarView extends Sprite 
	{
		private var controlBar:ControlBar;
		
		public function ControlBarView() 
		{
			controlBar = new ControlBar();
			
			addChild(controlBar);
			resize();
		}
		
		public function resize():void
		{
			this.y = Global.root.stage.stageHeight - Config.CONTROLBAR_BG_HEIGHT;
			controlBar.resize();
		}
	}

}