package com.lachhh.lachhhengine.camera {
	import com.lachhh.ResolutionManager;
	import com.lachhh.flash.EmptyMainGame;
	import com.lachhh.flash.debug.DebugDraw;

	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * @author LachhhSSD
	 */
	public class CameraFlash extends CameraBase {
		static public var mainCamera:CameraFlash;
		public var gameVisualContainer:CameraFlashContainers ;
		public var visualStaticContainer:Sprite ;
		public var debugDraw:DebugDraw;
		
		private var mouseInWorld:Point = new Point();
		
		static public var tempRect:Rectangle = new Rectangle();
		private var _main:EmptyMainGame;
		
		public function CameraFlash(main:EmptyMainGame) {
			super();
			_main = main;
			visualStaticContainer = new Sprite();
			
			gameVisualContainer = new CameraFlashContainers(new Sprite());
			mainCamera = this;
			
			
			boundsFOV.width = ResolutionManager.getGameWidth();
			boundsFOV.height = ResolutionManager.getGameHeight();
			boundsFOV.x = 0;
			boundsFOV.y = 0;
			
		}
		
		override public function start() : void {
			super.start();
			_main.addChildAt(gameVisualContainer.container, 0);
			_main.addChildAt(visualStaticContainer, 0);
			
			debugDraw = DebugDraw.addToActor(this, gameVisualContainer.debugVisual);
		}
		
		override public function update() : void {
			super.update();
			updateBounds();
			gameVisualContainer.container.scaleX = zoomScale;
			gameVisualContainer.container.scaleY = zoomScale;
			gameVisualContainer.container.x = -boundsFOV.x*zoomScale;
			gameVisualContainer.container.y = -boundsFOV.y*zoomScale;			
		}
				
		public function getMouseInWorldFlash():Point {
			mouseInWorld.x = _main.mouseX + boundsFOV.x;
			mouseInWorld.y = _main.mouseY + boundsFOV.y;
			return mouseInWorld;
		}
		
		override public function destroy() : void {
			super.destroy();
			_main.removeChild(gameVisualContainer.container);
			_main.removeChild(visualStaticContainer);
		}
	}
}
