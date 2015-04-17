package shlplayer.model.video.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author shl
	 */
	public class VideoPlayerEvent extends Event 
	{
		public static const VIDEO_ERROR:String = "videoError";
		public static const VIDEO_BUFFER_FULL:String = "videoBufferFull";
		public static const VIDEO_BUFFER_EMPTY:String = "videoBufferEmpty";
		public static const VIDEO_START:String = "videoStart";
		public static const VIDEO_STOP:String = "videoStop";
		public static const VIDEO_UPDATE:String = "videoUpdate";
		
		public var data:Object;
		
		public function VideoPlayerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}