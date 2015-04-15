package shlplayer.model.video 
{
	import flash.display.Sprite;
	import flash.events.NetStatusEvent;
	import flash.media.StageVideo;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import shlplayer.model.video.interfaces.IVideoPlayer;
	import util.Global;
	
	/**
	 * ...
	 * @author shl
	 */
	public class VideoPlayer extends Sprite implements IVideoPlayer 
	{
		protected var video:Video;
		protected var stageVideo:StageVideo;
		protected var useStageVideo:Boolean = false;
		protected var nc:NetConnection;
		protected var ns:NetStream;
		
		protected var ratio:Number;
		protected var _width:Number = 0;
		protected var _height:Number = 0;
		
		public function VideoPlayer() 
		{
			init();
		}
		
		protected function init():void
		{
			video = new Video();
			video.smoothing = true;
			addChild(video);
			
			nc = new NetConnection();
			nc.connect(null);
			ns = new NetStream(nc);
			ns.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
		}
		
		private function onNetStatus(e:NetStatusEvent):void 
		{
			switch(e.info.code)
			{
				
			}
		}
		
		public function switchStageVideo(tryHardware:Boolean = true):void
		{
			if (Global.root.stage.stageVideos == null || Global.root.stage.stageVideos.length == 0 || !Global.stageVideoAvailable)
			{
				if (this.useStageVideo != tryHardware)
				{
					useStageVideo = tryHardware;
					if (useStageVideo)
					{
						if (this.video && contains(this.video))
						{
							removeChild(video);
							video.clear();
							video = null;
						}
						stageVideo = Global.root.stage.stageVideos[0];
						stageVideo.attachNetStream(ns);
					}
					else
					{
						if (video = null)
						{
							ns.close();
							stageVideo.attachNetStream(null);
						}
						video = new Video();
						video.smoothing = true;
						video.attachNetStream(this.ns);
						addChild(video);
					}
				}
			}
		}
		
		public function play(url:String):void 
		{
			
		}
		
		public function seek(seekTime:Number):void 
		{
			
		}
		
		public function resize(w:Number, w:Number):void 
		{
			
		}
		
		public function get isPlaying():Boolean 
		{
			return _isPlaying;
		}
		
		public function set isPlaying(value:Boolean):void 
		{
			_isPlaying = value;
		}
		
		public function get volume():Number 
		{
			return _volume;
		}
		
		public function set volume(value:Number):void 
		{
			_volume = value;
		}
		
		public function get time():Number 
		{
			return _time;
		}
		
		public function get bufferTime():Number 
		{
			return _bufferTime;
		}
		
		public function get isBuffering():Boolean 
		{
			return _isBuffering;
		}
		
		public function get bufferPercent():Number 
		{
			return _bufferPercent;
		}
		
		public function get duration():Number 
		{
			return _duration;
		}
		
	}

}