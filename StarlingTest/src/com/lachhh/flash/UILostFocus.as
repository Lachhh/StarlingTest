package com.lachhh.flash {
	import com.jsb.MainGame;
	import com.lachhh.ResolutionManager;
	import com.lachhh.io.KeyManager;
	import com.lachhh.lachhhengine.animation.AnimationFactory;
	import com.lachhh.lachhhengine.sfx.Jukebox;
	import com.lachhh.lachhhengine.ui.UIBase;

	/**
	 * @author LachhhSSD
	 */
	public class UILostFocus extends UIBase {
		private var _wasMusicMuted:Boolean ;
		private var _wasSoundMuted:Boolean ; 
		public function UILostFocus() {
			super(AnimationFactory.EMPTY);
			if(MainGame.instance.gameSceneManager.hasAScene && MainGame.instance.gameSceneManager.gameScene.enabled) {
				MainGame.instance.gameSceneManager.gameScene.pause(true);
				_wasMusicMuted = Jukebox.MUSIC_MUTED;
				_wasSoundMuted = Jukebox.SFX_MUTED;
				Jukebox.MUSIC_MUTED = true;
				Jukebox.SFX_MUTED = true ;
				px = ResolutionManager.getGameWidth()*0.5;
				py = ResolutionManager.getGameHeight()*0.5;
			} else {
				destroy();
			}
		}

		override public function update() : void {
			super.update();
			if(KeyManager.IsMouseDown()) {
				MainGame.instance.gameSceneManager.gameScene.pause(false);
				Jukebox.MUSIC_MUTED = _wasMusicMuted;
				Jukebox.SFX_MUTED = _wasSoundMuted ;
				destroy();
			}
		}
	}
}
