package com.berzerkstudio {
	import com.zombidle.starling.AtlasKnightVisual;
	import com.berzerkstudio.flash.display.ShapeObject;
	import starling.display.Image;
	import starling.display.DisplayObject;

	import com.berzerkstudio.flash.display.DisplayObject;
	import com.berzerkstudio.flash.meta.Vector3;
	import com.lachhh.lachhhengine.actor.Actor;

	import flash.geom.Transform;

	public class MetaCachedGO {
		static public var LIFE_CACHED : int = 10;
		static public var NULL : MetaCachedGO = createNull();

		public var go : Actor ;
		public var id:int ;
		public var cacheId:int ;
		
		public var shapeObject:com.berzerkstudio.flash.display.ShapeObject;
		
		public var meshVertices:Vector.<Vector3>;
		public var transform:Transform ;
		
		public var nextCachedGO:MetaCachedGO = null;	
		public var nextActiveGO:MetaCachedGO = null;
		public var prevActiveGO:MetaCachedGO = null;
		public var isCached:Boolean = true;
		public var starlingImage:Image ;
		
		public var notUsed:Boolean = false;
		public var firstDraw:Boolean = false;
		public var firstDrawPerCache:Boolean = false;
		
		public var isLite:Boolean = false;
		
		public var lifeCached:int = LIFE_CACHED;
		
		static private var _voidPos : Vector3 = new Vector3(-1000, -1000, -1000);
		static private var _zero : Vector3 = Vector3.zero;
		public var isNull : Boolean = false;

		public function triggerUsed() : void {
			lifeCached = LIFE_CACHED;
			isCached = false;
		}
		
		public function init(d:com.berzerkstudio.flash.display.ShapeObject):void {
			shapeObject = d;
			shapeObject.metaGo = this;
			isCached = false;
		}
		
		public function onCache():void {
			if(isCached) return ;
			
			if(starlingImage != null && starlingImage.parent) {
				//starlingImage.parent.removeChild(starlingImage);
				starlingImage.visible = false;
				AtlasKnightVisual.cacheImage(starlingImage);
				//starlingImage.visible = false;
			}
			starlingImage = null;
			shapeObject.metaGo = null;
			isCached = true;
			shapeObject = null;
		}
		
		public function getImage():Image {
			if(isCached) {
				return null;
			}
			if(starlingImage == null) {
				starlingImage = AtlasKnightVisual.getImage(shapeObject.metaDisplayObject.textureName);
			}
			starlingImage.visible = true;
			return starlingImage;
		}
		
	
		
		public function Dispose():void {
			
		}
		
		static private function createNull() : MetaCachedGO {
			var result:MetaCachedGO = new MetaCachedGO();
			result.isNull = true;
			return result;
		}
	} 
}