package com.zombidle.starling {
	import starling.core.Starling;
	import starling.events.Event;
	import starling.textures.RenderTexture;
	import starling.utils.AssetManager;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	import starling.utils.SystemUtil;
	import starling.utils.formatString;

	import com.lachhh.io.Callback;

	import flash.desktop.NativeApplication;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	/**
	 * @author LachhhSSD
	 */
	public class StarlingMain {
		static public var starling : Starling;
		static public var starlingAssets : AssetManager;
		static private var callbackOnEndLoad : Callback;
		static public var metaFlas : MetaFlasAll;
		static private const StageWidth:int  = 1280;//480;
        static private const StageHeight:int = 720;//320;
		
		public function StarlingMain() {
			
		}

		static public function initWeb(stage:Stage, c:Callback):void {
			callbackOnEndLoad = c;
			Starling.multitouchEnabled = true; // for Multitouch Scene
            Starling.handleLostContext = true; // recommended everywhere when using AssetManager
            RenderTexture.optimizePersistentBuffers = true; // should be safe on Desktop
			
			
			starling = new Starling(StarlingStage, stage, null, null, "auto", "auto");
          	//starling.stage.stageWidth    = StageWidth;  // <- same size on all devices!
           //starling.stage.stageHeight   = StageHeight; // <- same size on all devices!
           	starling.simulateMultitouch = true;
            starling.enableErrorChecking = Capabilities.isDebugger;
            starling.addEventListener(starling.events.Event.ROOT_CREATED, function():void
            {
                loadAssets(startGame);
            });
			starling.start();
		}
		
		static public function initMobile(stage:Stage, c:Callback):void {
			callbackOnEndLoad = c;
			var iOS:Boolean = SystemUtil.platform == "IOS";
			var defaultScaleMode:String = ScaleMode.NO_BORDER; //ScaleMode.SHOW_ALL;
            var stageSize:Rectangle  = new Rectangle(0, 0, StageWidth, StageHeight);
            var screenSize:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
            var viewPort:Rectangle = RectangleUtil.fit(stageSize, screenSize, defaultScaleMode, iOS);
            //var scaleFactor:int = viewPort.width < 480 ? 1 : 2; // midway between 320 and 640
			var scaleFactor:int = 1;
			
            Starling.multitouchEnabled = true; // useful on mobile devices
            Starling.handleLostContext = true; // recommended everywhere when using AssetManager
            RenderTexture.optimizePersistentBuffers = iOS; // safe on iOS, dangerous on Android

            starling= new Starling(StarlingStage, stage, viewPort, null, "auto", "auto");
            starling.stage.stageWidth    = StageWidth;  // <- same size on all devices!
            starling.stage.stageHeight   = StageHeight; // <- same size on all devices!
            starling.enableErrorChecking = Capabilities.isDebugger;
            starling.simulateMultitouch  = false;
            starling.addEventListener(starling.events.Event.ROOT_CREATED, function():void
            {
				if (!SystemUtil.isDesktop) {
                	loadAssetsMobile(scaleFactor, startGame);
				} else {
					loadAssets(startGame);
				}
            });
			starling.start();
			
			 if (!SystemUtil.isDesktop)
            {
                NativeApplication.nativeApplication.addEventListener(
                        flash.events.Event.ACTIVATE, function (e:*):void { starling.start(); });
                NativeApplication.nativeApplication.addEventListener(
                        flash.events.Event.DEACTIVATE, function (e:*):void { starling.stop(true); });
            }
		}
		
		static private function loadAssets(onComplete:Function):void
        {
            var assets:AssetManager = new AssetManager();
            assets.verbose = Capabilities.isDebugger;
            assets.enqueue(EmbeddedAssets);

            assets.loadQueue(function(ratio:Number):void
            {
               // mProgressBar.ratio = ratio;
                if (ratio == 1) {
					onComplete(assets);
				}
            });
        }
		
		static private function loadAssetsMobile(scaleFactor:int, onComplete:Function):void
        {
             var appDir:File = File.applicationDirectory;
            var assets:AssetManager = new AssetManager(scaleFactor);

            assets.verbose = Capabilities.isDebugger;
            assets.enqueue(
                    appDir.resolvePath(formatString("assets/textures/{0}x", scaleFactor)),
					appDir.resolvePath("assets/fonts")
            );

            // Now, while the AssetManager now contains pointers to all the assets, it actually
            // has not loaded them yet. This happens in the "loadQueue" method; and since this
            // will take a while, we'll update the progress bar accordingly.

            assets.loadQueue(function(ratio:Number):void
            {
               // mProgressBar.ratio = ratio;
                if (ratio == 1) onComplete(assets);
            });
        }
		
		static private function startGame(assets:AssetManager):void
        {
            starlingAssets = assets;
			MetaFlasAll.init();
			if(callbackOnEndLoad) callbackOnEndLoad.call();
        }
	}
}
