package com.flashinit {
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.sfx.Jukebox;
	import com.zombidle.MainGame;

	import flash.display.Sprite;
	/**
	 * @author LachhhSSD
	 */
	public class ReleaseInit extends Sprite {
		public function ReleaseInit() {
				
			//(preloader as BerzerkPreloader).autoStart = true;
			
			VersionInfo.isDebug = false;
			VersionInfo.removeStuffThatArentFinished = true;
			
			var m:MainGame = new MainGame();
			stage.addChild(m);
			m.init();
			m.startFromNormal();
			
			Jukebox.MUSIC_VOLUME = 1;
			Jukebox.SFX_VOLUME = 1;
			Jukebox.MUSIC_MUTED = false;
			Jukebox.SFX_MUTED = false;
		}
	}
}
