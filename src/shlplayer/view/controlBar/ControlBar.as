package shlplayer.view.controlBar 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import util.Config;
	import util.Global;
	
	/**
	 * ...
	 * @author shl
	 */
	public class ControlBar extends Sprite 
	{
		private var controlBarbg:Shape;
		
		public function ControlBar() 
		{
			init();
		}
		
		private function init():void
		{
			controlBarbg = new Shape();
			controlBarbg.graphics.beginFill(Config.CONTROLBAR_BG_COLOR, Config.CONTROLBAR_BG_ALPHA);
			controlBarbg.graphics.drawRect(0, 0, 1, Config.CONTROLBAR_BG_HEIGHT);
			controlBarbg.graphics.endFill();
			
			addChild(controlBarbg);
			resize();
		}
		
		public function resize():void
		{
			controlBarbg.width = Global.root.stage.stageWidth;
		}
	}

}