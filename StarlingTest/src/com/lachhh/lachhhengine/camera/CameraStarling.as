package com.lachhh.lachhhengine.camera {
	import starling.display.Sprite;

	import com.lachhh.ResolutionManager;
	import com.lachhh.flash.debug.DebugDraw;
	import com.zombidle.starling.StarlingStage;
	/**
	 * @author LachhhSSD
	 */
	public class CameraStarling extends CameraBase {
		static public var mainCamera : CameraStarling;
		public var gameVisualContainer : CameraStarlingContainers ;
		public var visualStaticContainer:Sprite ;
		public var debugDraw:DebugDraw;
		
		public function CameraStarling() {
			super();
			visualStaticContainer = new Sprite();
			
			gameVisualContainer = new CameraStarlingContainers(new Sprite());
			mainCamera = this;
		
			boundsFOV.width = ResolutionManager.getGameWidth();
			boundsFOV.height = ResolutionManager.getGameHeight();
			boundsFOV.x = 0;
			boundsFOV.y = 0;	
		}
		
		override public function start() : void {
			super.start();
			StarlingStage.instance.addChild(gameVisualContainer.container);
			StarlingStage.instance.addChild(visualStaticContainer);
		}
		
		

		override public function update() : void {
			super.update();
			updateBounds();
			gameVisualContainer.container.scaleX = zoomScale;
			gameVisualContainer.container.scaleY = zoomScale;
			gameVisualContainer.container.x = -boundsFOV.x*zoomScale;
			gameVisualContainer.container.y = -boundsFOV.y*zoomScale;			
		}
		
		
		override public function destroy() : void {
			super.destroy();
			StarlingStage.instance.removeChild(gameVisualContainer.container);
			StarlingStage.instance.removeChild(visualStaticContainer);
		}
	}
}
