package shlplayer.controller 
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import shlplayer.Order;
	import util.FlashCookie;
	import util.Global;
	
	/**
	 * ...
	 * @author shl
	 */
	public class StartUpCommand extends SimpleCommand implements ICommand 
	{
		
		public function StartUpCommand() 
		{
			super();
			
		}
		
		override public function execute(param1:INotification):void 
		{
			readCookie();
			sendNotification(Order.INIT_VIEW);
		}
		
		private function readCookie():void
		{
			var volume:* = FlashCookie.getValue("volume");
			if (volume != null)
			{
				Global.currentVolume = volume;
			}
		}
	}

}