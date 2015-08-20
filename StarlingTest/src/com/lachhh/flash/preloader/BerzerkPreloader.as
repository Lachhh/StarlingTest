package com.lachhh.flash.preloader {
	import com.lachhh.flash.IPreloader;
	import com.lachhh.io.Callback;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	/**
	 * @author Administrator
	 */
	public class BerzerkPreloader extends MovieClip implements IPreloader {
		
		private var _visual:BERZERK_PRELOADER;
		private var _loader:BerzerkLoader ;
		private var _callback:Callback;
		private var _percent:Number  ;
		private var _splashScreen:MovieClip;
		private var _sponsorLink:String ;
		private var _berzerkLink:String ;
		private var _blackScreen:MovieClip ;
		private var _showingBerzerk:Boolean = true;
		private var _playBtn : BTNPRELOADSTART;
		private var _playClicked:Boolean = false;
		private var _w:int ;
		private var _h:int ;
		public var autoStart:Boolean = false;
		public function BerzerkPreloader(w:int, h:int, berzerkLink:String, sponsorSplashScreen:MovieClip, sponsorLink:String){
			_w = w;
			_h = h;
			_sponsorLink = sponsorLink;
			_berzerkLink = berzerkLink;
			_splashScreen = sponsorSplashScreen;
		}
		
		
		public function init():void {
			_blackScreen = new MovieClip();
			_blackScreen.graphics.beginFill(0);
			_blackScreen.graphics.drawRect(0, 0, _w, _h);
			_blackScreen.graphics.endFill();
			
			
			/*_blackScreen.buttonMode = true;
			_blackScreen.addEventListener(MouseEvent.MOUSE_DOWN, onClick);*/
			
			
			addChild(_blackScreen);
			
			_visual = new BERZERK_PRELOADER();
			_visual.x = _w/2;
			_visual.y = _h/2;
			
			_playBtn = new BTNPRELOADSTART();
			_playBtn.y = -10;
			_playBtn.scaleX = _playBtn.scaleY = 2;
			_playBtn.visible = false;
			_playBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickPlay);
			_visual.addChild(_playBtn);
			if(_berzerkLink != null && _berzerkLink != "") {
				berzerkHitArea.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
				berzerkHitArea.buttonMode = true;
			}
			
			/*if(VersionInfo.useGamerSafe) {
				gsPart.addEventListener(MouseEvent.MOUSE_DOWN, onClickGsPart);
				gsPart.buttonMode = true;
			} else {
				gsPart.visible = false;
				_playClicked = true;
			}*/
			
			if(_splashScreen != null) {
				_splashScreen.mouseEnabled = false;
				_splashScreen.mouseChildren = false;
				_splashScreen.gotoAndStop(1);
				_splashScreen.x = _w/2;
				_splashScreen.y = _h/2;
			}
			
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			_loader = new BerzerkLoader();
			_loader.visual.y = -50;
			_visual.addChild(_loader.visual);
			_loader.visual.mouseEnabled = false;
			_loader.visual.mouseChildren = false;
			addChild(_visual);
		}
		
		
		
		public function onClick(e:Event):void {
			if(_showingBerzerk){ 
				navigateToURL(new URLRequest(_berzerkLink), "_blank");
				//ExternalAPIManager.metricsAPI.RecordStats(_berzerkLink, MetricGroup.VIRAL);
			} else {
				navigateToURL(new URLRequest(_sponsorLink), "_blank");
				//ExternalAPIManager.metricsAPI.RecordStats(_sponsorLink, MetricGroup.VIRAL);
			}
		}
		 
		
		
		private function onEnterFrame(e:Event):void {
			_percent = (_visual.root.loaderInfo.bytesLoaded / _visual.root.loaderInfo.bytesTotal);
			_loader.ShowProgress(_percent);
			_loader.Update();
			if(_percent >= 1) {
				_playBtn.visible = true;
				_loader.visual.alpha -= 0.05;
				if(_loader.visual.alpha < 0) {
					_loader.visual.alpha = 0 ;
					_loader.visual.visible = false;
				}
				loading.alpha = _loader.visual.alpha;
				_playBtn.alpha = 1-_loader.visual.alpha; 
				if(_playClicked || autoStart) { 
					_visual.alpha -= 0.05;
					_playBtn.alpha = _visual.alpha;
					if(_visual.alpha <= 0) {
						ShowSponsorSplashScreen();
					} 
				}
			}
		}

		private function onClickPlay(e:Event):void {
			_playClicked = true;
		}

		private function onEnterSplashScreen(e:Event):void {
			if(_splashScreen.currentFrame >= _splashScreen.totalFrames-2) {
				Close();
			}	
		}
		
		public function ShowSponsorSplashScreen():void {
			_playBtn.visible = false;
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			removeChild(_visual);
			if(_splashScreen != null) {
				addEventListener(Event.ENTER_FRAME, onEnterSplashScreen);
				addChild(_splashScreen);
				_splashScreen.play();
				_showingBerzerk = false;
			} else {
				Close();
			}
		}
		
		public function Close():void {
			berzerkHitArea.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			removeEventListener(Event.ENTER_FRAME, onEnterSplashScreen);
			_playBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickPlay);
			_callback.call();
		}
		
		public function get callback():Callback {
			return _callback;
		}
		
		public function get visual():MovieClip {
			return this;
		}
		
		public function set callback(c:Callback):void {
			_callback = c;
		}
		
		public function get berzerkHitArea():MovieClip {
			return MovieClip(_visual.getChildByName("berzerk"));
		}
				
		private function get loading():MovieClip {
			return MovieClip(_visual.getChildByName("loading"));
		}	
	
	}
}
