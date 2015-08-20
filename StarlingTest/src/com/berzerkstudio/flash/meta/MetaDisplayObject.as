
package com.berzerkstudio.flash.meta {
	public class MetaDisplayObject {
		public var name:String = "";
		public var theClassName:String = "";
		public var theClassId:int = -1;
		public var transform:Meta2DTransform = new Meta2DTransform();
		public var isButton:Boolean = false;
		public var isAnimAsset:Boolean = false;
		
		public var metaFlaId:int = -1;
		//public var alpha:float = 1;
		
		//MetaShapeObject
		public var prefabId:int = -1;
		public var prefabName:String = "";
		public var packedSpriteframe:int = 0;
		public var textureName:String = "";
		
		public var width:int = 0;
		public var height:int = 0;	
		
		//MetaTextField
		public var text:String = "";
		public var textSize:int = 12;
		public var textId:int = -1;
		public var textAlign:String = "l";
		public var fontName:String = "";
		public var r:Number = 0;
		public var g:Number = 0;
		public var b : Number = 0;
		public var anchorX : Number;
		public var anchorY : Number;
		
		
		public function isShape():Boolean { return prefabId != -1; }
		public function isTextField():Boolean { 
			return fontName != ""; 
		}
		public function get isNull():Boolean { return name == "";}
		
	}
}