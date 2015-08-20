package com.flashinit {
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.sfx.Jukebox;
	import com.zombidle.MainGame;

	import flash.display.Sprite;
	/**
	 * @author LachhhSSD
	 */
	public class QuickDebugInit extends Sprite {
		public function QuickDebugInit() {
				
			//(preloader as BerzerkPreloader).autoStart = true;
			VersionInfo.isDebug = true;
			
			VersionInfo.DEBUG_NoSounds = true;
			//VersionInfo.DEBUG_NoEnemies = true;
			//ModelGameWizardCodeEnum.OTT_GORE_THOMPSON.activated = true;
			//ModelGameWizardCodeEnum.CREEPY_MODE.activated = true;
			//ModelGameWizardCodeEnum.CORPORATE_MODE.activated = true;
			//VersionInfo.DLC_BOUGHT = true;
			//VersionInfo.DLC_ACTIVATED = true;
			
			var m:MainGame = new MainGame();
			stage.addChild(m);
			m.init();
			m.startDebug();
			//m.startFromNormal();
			
			Jukebox.MUSIC_VOLUME = 0;
			Jukebox.SFX_VOLUME = 0;
			MainGame.instance.stage.nativeWindow.x = 338;
			MainGame.instance.stage.nativeWindow.y = 37;
		}
	}
}
