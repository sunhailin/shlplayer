package shlui
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author shl
	 */
	public class Image extends Sprite 
	{
		
		public function Image() 
		{
			super();
			
		}
		
		public static function imageFromClass(cls:Class):Image
		{
			var image:Image = new Image();
			var dp:DisplayObject = new cls();
			image.addChild(dp);
			return image;
		}
		
		public static function imageFromURL(url:String, w:int, h:int):Image
		{
			var image:Image = new Image();
			ImageManager.getInstance().loadURLWithoutCache(url, image, w, h);
			return image;
		}
	}

}