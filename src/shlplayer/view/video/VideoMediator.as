package shlplayer.view.video 
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
	public class VideoMediator extends Mediator implements IMediator 
	{
		public static const NAME:String = "videoMediator";
		
		public function VideoMediator(obj:Object=null) 
		{
			super(NAME, obj);
			
		}
		
		override public function listNotificationInterests():Array 
		{
			return [Order.VIDEO_SHOW,
					Order.RESIZE];
		}
		
		override public function handleNotification(note:INotification):void 
		{
			switch(note.getName())
			{
				case Order.VIDEO_SHOW:
					videoShow();
					break;
				case Order.RESIZE:
					resize();
					break;
			}
		}
		
		private function videoShow():void
		{
			if (this.videoView.parent == null)
			{
				Global.videoLayer.addChild(this.videoView);
			}
		}
		
		private function resize():void
		{
			
		}
		
		private function get videoView():VideoView
		{
			return viewComponent as VideoView;
		}
	}

}