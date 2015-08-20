package com.flashinit {
	import com.infernax.MainGame;
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.sfx.Jukebox;

	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	/**
	 * @author LachhhSSD
	 */
	public class DebugInit extends Sprite {
		public function DebugInit() {
				
			//(preloader as BerzerkPreloader).autoStart = true;
			VersionInfo.isDebug = true;
			
			
			//VersionInfo.DEBUG_NoEnemies = true;
			//ModelGameWizardCodeEnum.OTT_GORE_THOMPSON.activated = true;
			//ModelGameWizardCodeEnum.CREEPY_MODE.activated = true;
			//ModelGameWizardCodeEnum.CORPORATE_MODE.activated = true;
			//VersionInfo.DLC_BOUGHT = true;
			//VersionInfo.DLC_ACTIVATED = true;
			
			var m:MainGame = new MainGame();
			stage.addChild(m);
			m.init();
			
			m.startFromNormal();
			
			
			Jukebox.MUSIC_VOLUME = 1;
			Jukebox.SFX_VOLUME = 1;
			MainGame.instance.stage.nativeWindow.x = 338;
			MainGame.instance.stage.nativeWindow.y = 37;
			
			MainGame.instance.stage.scaleMode = StageScaleMode.EXACT_FIT;
			//MainGame.instance.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;	
		}
	}
}