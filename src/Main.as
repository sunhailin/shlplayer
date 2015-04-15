package
{
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import shlplayer.AppFacade;
	import util.Config;
	import util.Global;
	import util.Log;
	import util.Util;
	
	/**
	 * ...
	 * @author shl
	 */
	public class Main extends Sprite
	{
		private var password:String = "";//console
		
		public function Main()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Global.root = root as Sprite;
			Global.param = stage.loaderInfo.parameters;
			
			MonsterDebugger.initialize(this);
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.color = 0;
			
			Util.addMenuItem(Config.PLAYER_NAME + Global.PLAYER_VERSION, false, false);
			
			AppFacade.getInstance().startUp();
			
			//用于输入密码查看log
			Log.init();
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			password += String(e.keyCode);
			if (password.length > 14)
			{
				password = password.substr(password.length - 14, 14);
			}
			if (password == "67797883797669")
			{
				Log.toggleShow();
			}
			
		}
	
	}

}