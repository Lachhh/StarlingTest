package com.flashinit {
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.sfx.Jukebox;
	/**
	 * @author LachhhSSD
	 */
	public class QuickDebugWithSoundInit extends QuickDebugInit {
		public function QuickDebugWithSoundInit() {
			super();
		
			VersionInfo.DEBUG_NoSounds = false;
			Jukebox.MUSIC_VOLUME = 1;
			Jukebox.SFX_VOLUME = 1;
			Jukebox.MUSIC_MUTED = false;
			Jukebox.SFX_MUTED = false;
		}
	}
}
