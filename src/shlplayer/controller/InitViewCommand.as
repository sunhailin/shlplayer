package shlplayer.controller 
{
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import shlplayer.Order;
	import shlplayer.view.controlBar.ControlBarMediator;
	import shlplayer.view.controlBar.ControlBarView;
	import shlplayer.view.video.VideoMediator;
	import shlplayer.view.video.VideoView;
	import util.Global;
	
	/**
	 * ...
	 * @author shl
	 */
	public class InitViewCommand extends SimpleCommand implements ICommand 
	{
		
		public function InitViewCommand() 
		{
			super();
			
		}
		
		override public function execute(param1:INotification):void 
		{
			//创建各层容器,并排列深度
			var videoLayer:Sprite = new Sprite();
			var controlBarLayer:Sprite = new Sprite();
			
			Global.videoLayer = videoLayer;
			Global.controlBarLayer = controlBarLayer;
			
			Global.root.stage.addChild(videoLayer);
			Global.root.stage.addChild(controlBarLayer);
			//注册各viewmediator
			facade.registerMediator(new VideoMediator(new VideoView()));
			facade.registerMediator(new ControlBarMediator(new ControlBarView()));
			//发送各层启动的消息
			sendNotification(Order.VIDEO_SHOW);
			sendNotification(Order.CONTROLBAR_SHOW);
		}
	}

}