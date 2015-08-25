package com.zombidle.ui {
	import com.zombidle.starling.StarlingHeroStressTest;
	import flash.ui.Keyboard;
	import com.lachhh.io.KeyManager;
	import com.zombidle.MainGame;
	import com.lachhh.flash.debug.UIFPSCounter;
	import com.berzerkstudio.MetaCachedGOManager;
	import com.berzerkstudio.MetaCachedGO;
	import com.lachhh.lachhhengine.animation.AnimationFactory;
	import com.lachhh.lachhhengine.ui.UIBase;
	import com.zombidle.starling.StarlingStage;

	import flash.text.TextField;

	/**
	 * @author LachhhSSD
	 */
	public class UI_Debug extends UIBase {
		private var uiFPS : UIFPSCounter;
		
		public function UI_Debug() {
			super(AnimationFactory.ID_UI_DEBUG);
			uiFPS = new UIFPSCounter();
			uiFPS.py = 40;
			refresh();
		}
		
		
		override public function refresh() : void {
			super.refresh();
			texturesTxt.text = "Num Textures On Screen : " + StarlingStage.instance.numChildren;
			numCachedGOTxt.text = "Num Hero : " + MainGame.instance.gameSceneManager.gameScene.heroManager.actorList.length ;
			/*if(visual.stage) {
				numCachedGOTxt.text = "Stage : " + visual.stage.fullScreenWidth + "x" + visual.stage.fullScreenHeight;		
			}*/
		}
		
		
		override public function update() : void {
			super.update();
			//refresh();
			
			if(KeyManager.IsKeyPressed(Keyboard.ENTER)) {
				for (var i : int = 0; i < 5; i++) {
					new StarlingHeroStressTest();
				}
			}
		}
		
		public function get texturesTxt() : TextField { return visual.getChildByName("texturesTxt") as TextField;}
		public function get numCachedGOTxt() : TextField { return visual.getChildByName("numCachedGOTxt") as TextField;}
	}
}
