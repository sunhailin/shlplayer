package util 
{
	import flash.geom.Rectangle;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	/**
	 * ...
	 * @author shl
	 */
	public class Util 
	{
		
		public function Util() 
		{
			
		}
		
		// add right click menu item
		public static function addMenuItem(str:String, separatorBefore:Boolean = false, enabled:Boolean = true, visible:Boolean = true):void
		{
			var contextMene:ContextMenu = new ContextMenu();
			var menuItem:ContextMenuItem = new ContextMenuItem(str, separatorBefore, enabled, visible);
			contextMene.customItems.push(menuItem);
			Global.root.contextMenu = contextMene;
		}
		
		public static function getCenterRectangle(bigRect:Rectangle, littleRect:Rectangle):Rectangle
		{
			var xx:Number;
			var yy:Number;
			var width:Number;
			var height:Number;
			var widthScale:Number = 1;
			var heightScale:Number = 1;
			if ((littleRect.width > 0) && (littleRect.height > 0))
			{
				widthScale = (bigRect.width / littleRect.width);
				heightScale = (bigRect.height / littleRect.height);
			}
			if (widthScale < heightScale)
			{
				width = (littleRect.width * widthScale);
				height = (littleRect.height * widthScale);
				xx = 0;
				yy = ((bigRect.height - height) / 2);
			}
			else
			{
				width = (littleRect.width * heightScale);
				height = (littleRect.height * heightScale);
				xx = ((bigRect.width - width) / 2);
				yy = 0;
			}
			return (new Rectangle(xx, yy, width, height));
		}
	}

}