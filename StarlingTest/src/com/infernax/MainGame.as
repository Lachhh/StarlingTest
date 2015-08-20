package com.infernax {
	import com.infernax.meta.MetaGameProgress;
	import com.infernax.multilingual.TextFactory;
	import com.infernax.scenes.GameSceneManager;
	import com.infernax.scenes.SimpleGameScene;
	import com.lachhh.flash.RightClickMenu;
	import com.lachhh.flash.debug.UIFPSCounter;
	import com.lachhh.flash.debug.UIFontLoopkup;
	import com.lachhh.io.KeyManager;
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.sfx.Jukebox;
	import com.lachhh.lachhhengine.ui.UIBase;

	import flash.display.StageDisplayState;
	import flash.display.StageQuality;
	import flash.geom.Point;
	import flash.ui.Keyboard;

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

			fpsCounter = new UIFPSCounter();
			fpsCounter.show(false);
			new UIFontLoopkup();

			if(VersionInfo.DEBUG_NoSounds) {
				Jukebox.MUSIC_MUTED = true;
				Jukebox.SFX_MUTED = true;
			}
			
			RightClickMenu.addAllContextMenuItem();

			stage.focus = null;
			TextFactory.instance.init();
			stage.color = 0x000000;
		}
		
		public function startFromNormal():void {
			MetaGameProgress.instance.loadFromLocal();
			
			stage.quality = StageQuality.LOW;
			
		}

		public function startFromIngame():void {
			
		}
		
		public function startDebug():void {
			
		}
		
		override public function update():void {
			super.update();
			gameSceneManager.update();
											
			KeyManager.update();
			
			stage.color = Math.random()*uint.MAX_VALUE;
		}
	}
}
