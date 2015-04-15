package shlplayer.view.controlBar 
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import shlplayer.Order;
	import util.Global;
	
	/**
	 * ...
	 * @author shl
	 */
	public class ControlBarMediator extends Mediator implements IMediator 
	{
		public static const NAME:String = "controlBarMediator";
		
		public function ControlBarMediator(obj:Object=null) 
		{
			super(NAME, obj);
			
		}
		
		override public function listNotificationInterests():Array 
		{
			return [Order.CONTROLBAR_SHOW,
					Order.RESIZE];
		}
		
		override public function handleNotification(note:INotification):void 
		{
			switch(note.getName())
			{
				case Order.CONTROLBAR_SHOW:
					controlBarShow();
					break;
				case Order.RESIZE:
					resize();
					break;
			}
		}
		
		private function controlBarShow():void
		{
			if (this.controlBarView.parent == null)
			{
				Global.controlBarLayer.addChild(this.controlBarView);
			}
		}
		
		private function resize():void
		{
			controlBarView.resize();
		}
		
		private function get controlBarView():ControlBarView
		{
			return viewComponent as ControlBarView;
		}
	}

}