package com.lachhh.lachhhengine.camera {
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	/**
	 * @author LachhhSSD
	 */
	public class CameraStarlingContainers {
		static public var instance:CameraStarlingContainers;
		public var allLayerVisual:Vector.<DisplayObjectContainer> = new Vector.<DisplayObjectContainer>();
		public var container:DisplayObjectContainer;
		
		public var backgroundVisual : DisplayObjectContainer ;
		public var backFxVisual : DisplayObjectContainer ;
		public var heroVisual : DisplayObjectContainer ;
		public var enemyVisual : DisplayObjectContainer ;
		public var ammoVisual : DisplayObjectContainer ;
		public var foreFxVisual : DisplayObjectContainer ;
		public var debugVisual : DisplayObjectContainer ;

		public function CameraStarlingContainers(pContainer:DisplayObjectContainer) {
			container = pContainer;
			
			backgroundVisual = createLayerVisual();
			backFxVisual = createLayerVisual();
			ammoVisual = createLayerVisual();
			heroVisual = createLayerVisual();
			enemyVisual = createLayerVisual();
			
			foreFxVisual = createLayerVisual();
			debugVisual = createLayerVisual();
			instance = this;
		}


		private function createLayerVisual():DisplayObjectContainer {
			var result:Sprite = new Sprite();
			allLayerVisual.push(result);
			container.addChild(result);
			
			return result;
		}
		
		public function destroy():void {
			for (var i : int = 0; i < allLayerVisual.length; i++) {
				var d:DisplayObjectContainer = allLayerVisual[i];
				container.removeChild(d);
			}
			allLayerVisual = new Vector.<DisplayObjectContainer>();
			container = null; 
		}

	}
}
