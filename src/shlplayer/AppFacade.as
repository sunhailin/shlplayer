package shlplayer 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.StageVideoAvailabilityEvent;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import shlplayer.controller.InitViewCommand;
	import shlplayer.controller.StartUpCommand;
	import util.Global;
	
	/**
	 * ...
	 * @author shl
	 */
	public class AppFacade extends Facade implements IFacade 
	{
		
		public function AppFacade() 
		{
			
		}
		
		public static function getInstance():AppFacade
		{
			if (instance == null)
			{
				instance = new AppFacade();
			}
			
			return instance as AppFacade;
		}
		
		override protected function initializeController():void 
		{
			super.initializeController();
			registerCommand(Order.START_UP, StartUpCommand);
			registerCommand(Order.INIT_VIEW, InitViewCommand);
		}
		
		override protected function initializeModel():void 
		{
			super.initializeModel();
		}
		
		public function startUp():void
		{
			Global.root.stage.addEventListener(Event.RESIZE, onResize);
			Global.root.stage.addEventListener(StageVideoAvailabilityEvent.STAGE_VIDEO_AVAILABILITY, onStageVideoAvailable);
			sendNotification(Order.START_UP);
		}
		
		private function onStageVideoAvailable(e:StageVideoAvailabilityEvent):void 
		{
			Global.stageVideoAvailable = (e.availability == "available");
			sendNotification(Order.STAGE_VIDEO_CHANGED);
		}
		
		//send resize notification
		private function onResize(e:Event):void 
		{
			sendNotification(Order.RESIZE);
		}
	}

}