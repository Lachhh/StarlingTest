package com.zombidle.scenes {
	import starling.core.RenderSupport;
	import com.zombidle.starling.StarlingMain;
	import starling.display.DisplayObject;
	import com.zombidle.starling.MetaFlasAll;
	import com.zombidle.starling.SymbolManager;
	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	import com.berzerkstudio.flash.display.MovieClip;
	import starling.text.TextField;
	import flash.display.StageScaleMode;
	import com.zombidle.MainGame;
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
			
			var s:Stage = new Stage();
			
			//var img : Image = AtlasKnightVisual.createImg("KNIGHTVISUALS_STARLING_TEXTURE_111") ; 
			cameraStarling = new CameraStarling();
			
			for (var i : int = 0; i < 450; i++) {
				new StarlingHeroStressTest();
			}
			
			//new StarlingHeroTest2();
			
			displayObjectRender = new DisplayObjectRenderer();
			displayObjectRender.displayObject = s;
			displayObjectRender.displayObjectContainer = StarlingStage.instance;
			displayObjectRender.start();
			
			/*
			var textField1:TextField = new TextField(100, 100, "A White Derp", "BuzzSaw", 32, 0xffffff);
			textField1.x = 200;
			textField1.y = 200;
			var textField2:TextField = new TextField(100, 100, "A Green Derp", "BuzzSaw", 32, 0x00ff00);
			textField2.x = 300;
			textField2.y = 200;
			var textField3:TextField = new TextField(100, 100, "A Red Derp", "BuzzSaw", 32, 0xff0000);
			textField3.x = 400;
			textField3.y = 200;
			
			displayObjectRender.displayObjectContainer.addChild(textField1);
			displayObjectRender.displayObjectContainer.addChild(textField2);
			displayObjectRender.displayObjectContainer.addChild(textField3);
			 */
			 
			//img.x = 300;
			//img.y = 300;
			//StarlingStage.instance.addChild(img);
			//gameActor = new GameActor();
			//gameActor.fxAudience.metaPlayers = createDummyMetaPlayers();
			//camera.px = ResolutionManager.getGameWidth()*0.5;
			//camera.py = 650;

			//camera.addComponent(new LogicMoveWithKeyBoard());
			new UI_Debug();
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
