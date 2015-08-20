package com.zombidle.scenes {
	import com.zombidle.starling.StarlingHeroStressTest;
	import com.berzerkstudio.MetaCachedGOManager;
	import com.berzerkstudio.flash.display.DisplayObject;
	import com.berzerkstudio.flash.display.Stage;
	import com.lachhh.lachhhengine.camera.CameraStarling;
	import com.zombidle.starling.DisplayObjectRenderer;
	import com.zombidle.starling.StarlingHeroTest2;
	import com.zombidle.starling.StarlingStage;
	import com.zombidle.ui.UI_Debug;

	/**
	 * @author LachhhSSD
	 */
	public class DebugGameScene extends GameScene {
		
		public var cameraStarling : CameraStarling;
		private var displayObjectRender : DisplayObjectRenderer;
		
		
		public function DebugGameScene() {
			super();
		}

		override public function start() : void {
			super.start();
			new UI_Debug();
			var s:Stage = new Stage();
			
			//var img : Image = AtlasKnightVisual.createImg("KNIGHTVISUALS_STARLING_TEXTURE_111") ; 
			cameraStarling = new CameraStarling();
			
			for (var i : int = 0; i < 25; i++) {
				new StarlingHeroStressTest();
			}
			//new StarlingHeroTest2();
			
			displayObjectRender = new DisplayObjectRenderer();
			displayObjectRender.displayObject = s;
			displayObjectRender.displayObjectContainer = StarlingStage.instance;
			displayObjectRender.start();
			
			//img.x = 300;
			//img.y = 300;
			//StarlingStage.instance.addChild(img);
			//gameActor = new GameActor();
			//gameActor.fxAudience.metaPlayers = createDummyMetaPlayers();
			//camera.px = ResolutionManager.getGameWidth()*0.5;
			//camera.py = 650;

			//camera.addComponent(new LogicMoveWithKeyBoard());
		}

		override public function update() : void {
			super.update();
			displayObjectRender.Draw();
			MetaCachedGOManager.update();
		}
		
	/*	private function createDummyMetaPlayers():Array {
			var arrayOfName:Array = new Array();
			for (var i : int = 0; i < 15; i++) {
				arrayOfName.push("Dummy" + i);
			}
			
			return MetaPlayer.createDummyList(arrayOfName); 
		}*/
	}
}
