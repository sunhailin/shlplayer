package shlplayer.model.video 
{
	import flash.display.Sprite;
	import flash.events.NetStatusEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.media.StageVideo;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.Timer;
	import shlplayer.model.video.event.VideoPlayerEvent;
	import shlplayer.model.video.interfaces.IVideoPlayer;
	import util.Global;
	import util.Log;
	import util.Util;
	
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
		protected var videoWidth:Number = 0;
		protected var videoHeight:Number = 0;
		
		private var updateTimer:Timer;
		
		public function VideoPlayer() 
		{
			init();
		}
		
		protected function init():void
		{
			//用于向上层发送视频播放的时间和缓冲的时间
			updateTimer = new Timer(1000);
			updateTimer.addEventListener(TimerEvent.TIMER, onUpdateTimer);
			
			video = new Video();
			video.smoothing = true;
			addChild(video);
			
		}
		
		protected function onMetaData(obj:Object):void
		{
			Global.duration = obj.duration;
			if (!updateTimer.running)
			{
				updateTimer.reset();
				updateTimer.start();
			}
			videoWidth = obj.width;
			videoHeight = obj.height;
			ratio = obj.width / obj.height;
		}
		
		protected function onNetStatus(e:NetStatusEvent):void 
		{
			Log.log(this, e.info.code);
			switch(e.info.code)
			{
				case "NetStream.Play.StreamNotFound":
					onVideoError();
					break;
				case "NetStream.Buffer.Full":
					onBufferFull();
					break;
				case "NetStream.Buffer.Empty": 
					onBufferEmpty();
					break;
				case "NetStream.Play.Start": 
					onPlayStart();
					break;
				case "NetStream.Play.Stop": 
					onPlayStop();
					break;
			}
		}
		
		protected function onPlayStop():void
		{
			var ent:VideoPlayerEvent = new VideoPlayerEvent(VideoPlayerEvent.VIDEO_STOP);
			dispatchEvent(ent);
		}
		
		protected function onPlayStart():void
		{
			var ent:VideoPlayerEvent = new VideoPlayerEvent(VideoPlayerEvent.VIDEO_START);
			dispatchEvent(ent);
		}
		
		protected function onBufferEmpty():void
		{
			var ent:VideoPlayerEvent = new VideoPlayerEvent(VideoPlayerEvent.VIDEO_BUFFER_EMPTY);
			dispatchEvent(ent);
		}
		
		protected function onBufferFull():void
		{
			var ent:VideoPlayerEvent = new VideoPlayerEvent(VideoPlayerEvent.VIDEO_BUFFER_FULL);
			dispatchEvent(ent);
		}
		
		protected function onVideoError():void
		{
			var ent:VideoPlayerEvent = new VideoPlayerEvent(VideoPlayerEvent.VIDEO_ERROR);
			dispatchEvent(ent);
		}
		
		protected function onUpdateTimer(e:TimerEvent):void
		{
			var obj:Object = new Object();
			obj.bytesLoaded = ns.bytesLoaded;
			obj.bytesTotal = ns.bytesTotal;
			obj.bufferLength = ns.bufferLength + ns.time;
			obj.time = ns.time;
			
			var ent:VideoPlayerEvent = new VideoPlayerEvent(VideoPlayerEvent.VIDEO_UPDATE);
			ent.data = obj;
			dispatchEvent(ent);
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
			nc = new NetConnection();
			nc.connect(null);
			ns = new NetStream(nc);
			ns.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			
			ns.client = this;
			if (video != null)
			{
				video.attachNetStream(ns);
			}
			else
			{
				stageVideo.attachNetStream(ns);
			}
			ns.play(url);
		}
		
		public function seek(seekTime:Number):void 
		{
			
		}
		
		public function resize(w:Number, h:Number):void 
		{
			videoWidth = w;
			videoHeight = h;
			if (video == null && stageVideo == null)
			{
				return;
			}
			var tempWidth:int;
			var tempHeight:int;
			if (video != null)
			{
				tempWidth = video.videoWidth;
				tempHeight = video.videoHeight;
			}
			else
			{
				tempWidth = stageVideo.videoWidth;
				tempHeight = stageVideo.videoHeight;
			}
			tempHeight = tempWidth / ratio;
			var tempRect:Rectangle = Util.getCenterRectangle(new Rectangle(0, 0, this.videoWidth, this.videoHeight), new Rectangle(0, 0, tempWidth, tempHeight));
			if (video != null)
			{
				video.x = tempRect.x;
				video.y = tempRect.y;
				video.width = tempRect.width;
				video.height = tempRect.height;
			}
			else
			{
				stageVideo.viewPort = tempRect;
			}
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