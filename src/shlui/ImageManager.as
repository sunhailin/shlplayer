package shlui 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	/**
	 * ...
	 * @author shl
	 */
	internal class ImageManager 
	{
		
		private static var instance:ImageManager;
		
		public function ImageManager() 
		{
			
		}
		
		public static function getInstance():ImageManager
		{
			if (instance == null)
			{
				instance = new ImageManager();
			}
			return instance;
		}
		
		public function  loadURLWithoutCache(url:String, image:Image, w:int, h:int):void
		{
			var loader:Loader;
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void
				{
					image.addChild(loader);
					image.width = w;
					image.height = h;
				});
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			try
			{
				loader.load(new URLRequest(url), new LoaderContext(true));
			}
			catch (e:*)
			{
				trace("加载图片失败" + e);
			}
		}
		
		private function onError(e:IOErrorEvent):void
		{
			trace("加载图片失败");
		}
	}

}