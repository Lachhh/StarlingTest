package com.zombidle.starling {
	import starling.display.DisplayObjectContainer;

	import com.lachhh.lachhhengine.camera.CameraStarling;
	import com.lachhh.lachhhengine.components.ActorComponent;

	/**
	 * @author LachhhSSD
	 */
	public class RenderStarlingComponent extends ActorComponent {
		public var animView : StarlingImageView;
		public var xVisualOffset:Number = 0;
		public var yVisualOffset:Number = 0;
		
		public function RenderStarlingComponent(parent:DisplayObjectContainer) {
			super();
			animView = new StarlingImageView(parent);
		}
		
		override public function refresh() : void {
			super.refresh();
			if(actor == null) return ;
			animView.x = actor.px + xVisualOffset;
			animView.y = actor.py + yVisualOffset;
			animView.refresh();
		}
		
		override public function update() : void {
			super.update();
			
			animView.x = actor.px + xVisualOffset;
			animView.y = actor.py + yVisualOffset;
			animView.update();
		}

		override public function destroy() : void {
			super.destroy();
			animView.destroy();
		}
		
		public function getXRelativeToScreen():Number {
			return animView.x-CameraStarling.mainCamera.boundsFOV.x;
		}
		
		public function getYRelativeToScreen():Number {
			return animView.y-CameraStarling.mainCamera.boundsFOV.y;
		}

	}
}
