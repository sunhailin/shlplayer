package shlplayer.model.video.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author shl
	 */
	public class VideoEvent extends Event 
	{
		
		public function VideoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}