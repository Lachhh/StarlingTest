package com.zombidle {
	import com.zombidle.scenes.CollectChestScene;
	import com.chestapp.playerio.ModelExternalPremiumAPIEnum;
	import com.chestapp.PlayerIOLachhhRPGController;
	import com.zombidle.scenes.ChestAppLoginScene;
	import com.lachhh.flash.RightClickMenu;
	import com.lachhh.flash.debug.UIFPSCounter;
	import com.lachhh.flash.debug.UIFontLoopkup;
	import com.lachhh.io.Callback;
	import com.lachhh.io.KeyManager;
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.sfx.Jukebox;
	import com.lachhh.lachhhengine.ui.UIBase;
	import com.zombidle.meta.MetaGameProgress;
	import com.zombidle.multilingual.TextFactory;
	import com.zombidle.scenes.DebugGameScene;
	import com.zombidle.scenes.GameSceneManager;
	import com.zombidle.starling.StarlingMain;

	import flash.display.StageQuality;

	public class MainGame extends DefaultMainGame {
		static public var instance:MainGame;
		public var gameSceneManager : GameSceneManager = new GameSceneManager();
		
		static public var dummyActor:Actor = new Actor();
		static public var fpsCounter:UIFPSCounter ;
		
		
		
		
		public function MainGame() {
	
		}
		
		override public function init():void {
			super.init();
			instance = this;
						
			UIBase.manager.add(dummyActor);

			//fpsCounter = new UIFPSCounter();
			//fpsCounter.show(false);
			//new UIFontLoopkup();

			if(VersionInfo.DEBUG_NoSounds) {
				Jukebox.MUSIC_MUTED = true;
				Jukebox.SFX_MUTED = true;
			}

			//RightClickMenu.addAllContextMenuItem();

			stage.focus = null;
			TextFactory.instance.init();
			//stage.color = 0x000000;
			stage.color = 0x1c2429;
			stage.frameRate = 60;
			
			PlayerIOLachhhRPGController.InitInstance(root, ModelExternalPremiumAPIEnum.TWITCH, VersionInfo.isPIODebug);
			MetaGameProgress.instance.loadFromLocal();
		}
		
		public function startFromNormal():void {
			MetaGameProgress.instance.loadFromLocal();
			stage.quality = StageQuality.LOW;
		}

		public function startFromIngame():void {
			
		}
		
		public function startDebug():void {
			if(VersionInfo.isIOS) {
				StarlingMain.initMobile(stage, new Callback(startStarlingScene, this, null));
			} else {
				StarlingMain.initWeb(stage, new Callback(startStarlingScene, this, null));
			}
		}
		
		private function startStarlingScene():void {
			//gameSceneManager.loadScene(new DebugGameScene());
			gameSceneManager.loadScene(new ChestAppLoginScene());
			//gameSceneManager.loadScene(new CollectChestScene());
		}
		
		
		
		
		override public function update():void {
			super.update();
			gameSceneManager.update();
											
			KeyManager.update();
		}
	}
}
