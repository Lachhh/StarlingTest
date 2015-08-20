package com.berzerkstudio.flash.geom {
	import com.berzerkstudio.flash.meta.MetaColorTransform;
	public class ColorTransform {
		public var redOffset:Number = 0;
		public var redMultiplier:Number = 0;
		public var greenOffset:Number = 0;
		public var greenMultiplier:Number = 0;
		public var blueOffset:Number = 0;
		public var blueMultiplier:Number = 0;
		public var alphaOffset:Number = 1;
		public var alphaMultiplier:Number = 1;
		
		public var mustUpdateColor:Boolean = false;
		
		public var color:Color = new Color(0,0,0,0);
		public var concatColor:Color = new Color(0,0,0,0);
		
		public var alphaColor:Color = Color.white;
		public var alphaConcatColor:Color = Color.white;
		
		public function Concat(parent:ColorTransform):Color {
		
			//concatColor[0] = ((1-parent.color[0])*color[0]) + parent.color[0];
			//concatColor[1] = ((1-parent.color[1])*color[1]) + parent.color[1];
			//concatColor[2] = ((1-parent.color[2])*color[2]) + parent.color[2];
			//concatColor[3] = ((1-parent.color[3])*color[3]) + parent.color[3];
			
			//alphaColor.a = parent.alphaColor.a * alphaColor.a;
			
			if(color.a != 0) {
				concatColor = color;
			} else {
				concatColor = parent.concatColor;
			}
			return concatColor;
		}
		
		public function LoadFromColorTransform(metaColor:MetaColorTransform):void {
			/*redOffset = metaColor.redOffset;
			redMultiplier = metaColor.redMultiplier;
			greenOffset = metaColor.greenOffset;
			greenMultiplier = metaColor.greenMultiplier;
			blueOffset = metaColor.blueOffset;
			blueMultiplier = metaColor.blueMultiplier;
			alphaOffset = metaColor.alphaOffset;
			alphaMultiplier = metaColor.alphaMultiplier;*/
			//colorUint = metaColor.color;
			
			color.r = metaColor.r;
			color.g = metaColor.g;
			color.b = metaColor.b;
			color.a = metaColor.a;
			concatColor = color;
			alphaColor.a = metaColor.alpha;
		}
				
		public function LoadFromString(s:String):void {
			if(s == null) {
				Dispose();
				return;
			}
			
			//var array:Array = s.Split(","[0]) ;
			/*
			redOffset = FlashUtils.myParseNumber(array[0]);
			redMultiplier = FlashUtils.myParseNumber(array[1]);
			greenOffset = FlashUtils.myParseNumber(array[2]);
			greenMultiplier = FlashUtils.myParseNumber(array[3]);
			blueOffset = FlashUtils.myParseNumber(array[4]);
			blueMultiplier = FlashUtils.myParseNumber(array[5]);
			alphaOffset = FlashUtils.myParseNumber(array[6]);
			alphaMultiplier = FlashUtils.myParseNumber(array[7]);*/
		}
		
		public function Dispose():void {
			color.r = color.g = color.b = color.a = 0;
			alphaColor.r = alphaColor.g = alphaColor.b = alphaColor.a = 1;
			
			/*redOffset = 0;
			redMultiplier = 0;
			greenOffset = 0;
			greenMultiplier = 0;
			blueOffset = 0;
			blueMultiplier = 0;
			alphaOffset = 1;
			alphaMultiplier = 1;*/
		}
	}

}