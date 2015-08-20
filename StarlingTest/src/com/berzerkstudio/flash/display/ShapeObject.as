package com.berzerkstudio.flash.display {
	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	public class ShapeObject extends DisplayObject {
		public var prefabId:int;
		public var prefabName:String;
		public var packedSpriteframe:int;
		public var textureWidth:int = 0;
		public var textureHeight : int = 0;
		public var anchorX : Number;
		public var anchorY : Number;

		public function ShapeObject() {
			super();
		}

		override public function LoadFromMeta(m : MetaDisplayObject) : void {
			super.LoadFromMeta(m);
			prefabId = m.prefabId;
			prefabName = m.prefabName;
			packedSpriteframe = m.packedSpriteframe;
			textureWidth = m.width;
			textureHeight = m.height;
			hitArea.width = m.width;
			hitArea.height = m.height;
			
			anchorX = m.anchorX;
			anchorY = m.anchorY;
		}
		
		override public function get width():Number{return textureWidth ;}
		override public function get height():Number{return textureHeight ;}
		override public function get isShape():Boolean{return true ;}
	}

}