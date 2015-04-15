package shlplayer.model.video.interfaces 
{
	
	/**
	 * ...
	 * @author shl
	 */
	public interface IVideoPlayer 
	{
		//播放一个流
		function play(url:String):void;
		function seek(seekTime:Number):void;
		function resize(w:Number, w:Number):void;
		
		function get isPlaying():Boolean;
		function set isPlaying(state:Boolean):void;
		function get volume():Number;
		function set volume(vol:Number):void;
		function get time():Number;
		function get bufferTime():Number;
		function get isBuffering():Boolean;
		function get bufferPercent():Number;
		function get duration():Number;
	}
	
}