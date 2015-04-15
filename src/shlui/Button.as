package shlui
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author shl
	 */
	public class Button extends SimpleButton 
	{
		
		public function Button() 
		{
			super();
			
		}
		
		public static function buttonFromImage(up:Image, over:Image, down:Image,hittest:Image = null):Button
		{
			var button:Button = new Button();
			button.upState = up;
			button.downState = down;
			button.overState = over;
			if (hittest == null)
			{
				button.hitTestState = up;
			}
			else
			{
				button.hitTestState = hittest;
			}
			return button;
		}
		
		public static function buttonFromSprite(up:Sprite, over:Sprite, down:Sprite, hittest:Sprite = null):Button
		{
			var button:Button = new Button();
			button.upState = up;
			button.downState = down;
			button.overState = over;
			if (hittest == null)
			{
				button.hitTestState = up;
			}
			else
			{
				button.hitTestState = hittest;
			}
			return button;
		}
	}

}