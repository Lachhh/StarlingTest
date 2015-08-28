package com.chestapp {
	import flash.net.dns.AAAARecord;
	import flash.events.LocationChangeEvent;
	import starling.core.Starling;
	import flash.geom.Rectangle;
	import flash.events.Event;
	import com.zombidle.starling.StarlingMain;
	import flash.media.StageWebView;
	import com.lachhh.io.Callback;
	/**
	 * @author Shayne
	 */
	public class MobileTwitchConnection {
		
		public static const AUTH_URL:String = "https://api.twitch.tv/kraken/oauth2/authorize?response_type=token&client_id=o3qkq9wrb3sewdpltereobqlrt2nqf2&redirect_uri=http://www.lachhhAndFriends.com/twitch/oauth.html&scope=user_read";
		
		public var onSuccessCallback:Callback;
		public var onErrorCallback:Callback;
		public var onLogoutCallback:Callback;
		
		private var closeOnNext:Boolean;
		
		private var webView:StageWebView;
		
		public function MobileTwitchConnection(){
			webView = new StageWebView();
			webView.addEventListener(Event.LOCATION_CHANGE, onLocationChange);
		}
		
		private function connect(url:String):void{
			webView.viewPort = new Rectangle(0, 0, StarlingMain.StageWidth, StarlingMain.StageHeight);
			webView.stage = Starling.current.nativeStage;
			
			webView.loadURL(url);
		}
	
		public function connectToAuth(success:Callback, failure:Callback):void{
			onSuccessCallback = success;
			onErrorCallback = failure;
			connect(AUTH_URL);
			//if(isAdmin) connect(AUTH_URL + "+channel_subscriptions"); 
		}
		
		public function connectForLogout(success:Callback, failure:Callback):void{
			onSuccessCallback = success;
			onErrorCallback = failure;
		}
		
		public function close():void{
			destroyWebView();
		}
		
		private function onLocationChange(event:LocationChangeEvent):void{
			//trace("onLocationChange : " + event.location);
			
			var newUrl:String = event.location;
			var str:String = "http://www.lachhhandfriends.com/twitch/oauth.html";
			newUrl = newUrl.toLowerCase();
			
			if(newUrl.indexOf(str) == 0) {
				//trace("authenticated!");
				if(newUrl.indexOf("#access_token=") != -1) {
					var a:Array = newUrl.split("#access_token=");
					var str1:String = a[1];
					var a2:Array = str1.split("&");
					var accessToken:String = a2[0];
					//trace(accessToken) ;
					onConnected(accessToken);
				} else {
					onError();
				}
				destroyWebView();
					 
			} else if(newUrl == "http://twitch.tv/logout") {
				closeOnNext = true;
			} else if(closeOnNext) {
				destroyWebView();
				closeOnNext = false;
				onLogout();
			}
		}
		
		private function destroyWebView():void{
			if(webView == null){ return; }
			webView.stop();
			webView.stage = null;
			webView.viewPort = new Rectangle(0,0,0,0);
			webView.dispose();
			webView = null;
		}
		
		private function onConnected(token:String):void{ if(onSuccessCallback) onSuccessCallback.callWithParams([token]); }
		private function onError():void{ if(onErrorCallback) onErrorCallback.call(); }
		private function onLogout():void{ if(onLogoutCallback) onLogoutCallback.call(); }
	}
}
