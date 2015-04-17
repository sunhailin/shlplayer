package util 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author shl
	 */
	public class Global 
	{
		public static const PLAYER_VERSION:String = "0.0.0.1";
		
		public static var root:Sprite;
		public static var param:Object;
		public static var stageVideoAvailable:Boolean;
		public static var videoLayer:Sprite;
		public static var controlBarLayer:Sprite;
		
		public static var currentVolume:Number = 1;
		public static var duration:Number = 0;
		
		
		public function Global() 
		{
			
		}
		
	}

}