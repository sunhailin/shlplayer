package util 
{
	import avmplus.getQualifiedClassName;
	import com.demonsters.debugger.MonsterDebugger;
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author shl
	 */
	public class Log 
	{
		private static var text:TextField;
		public function Log() 
		{
			
		}
		
		public static function init():void
		{
			text = new TextField();
			text.defaultTextFormat = new TextFormat("Courier New", 14, 0xffffff);
			text.autoSize = TextFieldAutoSize.LEFT;
			 if (ExternalInterface.available){
                try {
                    text.appendText((("浏览器标识：" + ExternalInterface.call("function(){ return navigator.userAgent; }")) + "\n"));
                } catch(error:Error) {
                    text.appendText(("Error: " + error.message));
                }
            }
			text.appendText((("Flash Player 运行时：" + Capabilities.manufacturer) + "\n"));
            text.appendText((("Flash Player 版本：" + Capabilities.version) + "\n"));
            text.appendText((("Flash Player 是否调试版：" + Capabilities.isDebugger) + "\n"));
            text.appendText((("操作系统：" + Capabilities.os) + "\n"));
            text.appendText((((("桌面分辨率：" + Capabilities.screenResolutionX) + "x") + Capabilities.screenResolutionY) + "\n"));
            text.appendText((("桌面DPI：" + Capabilities.screenDPI) + "\n\n"));
			text.visible = false;
		}
		
		public static function toggleShow():void
		{
			if (text.visible)
			{
				text.visible = false;
			}
			else
			{
				text.visible = true;
				Global.root.addChild(text);
			}
		}
		
		public static function log(caller:*, obj:Object):void
		{
			var str:String = getQualifiedClassName(caller) + "----->" + obj;
			trace(str);
			if (text.length > 100000)
				{
					text.text = "";
					text.appendText("too many log > 100000,clear!\n");
				}
			text.appendText(str);
			MonsterDebugger.trace(caller, obj);
		}
	}

}