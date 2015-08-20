package com.zombidle.starling {
	import starling.textures.Texture;
	import starling.display.Image;
	/**
	 * @author LachhhSSD
	 */
	public class AtlasKnightVisual {
		
		//static public var KNIGHTVISUALS_STARLING_TEXTURE_248:String = "KNIGHTVISUALS_STARLING_TEXTURE_248";
		static public var cachedImg:Vector.<Image> = new Vector.<Image>(); 
		static public function createImg(id:String):Image {
			var t:Texture = StarlingMain.starlingAssets.getTexture(id);
			var result:Image = new Image(t);
			return result;
		}
		
		static public function getImage(id:String):Image {
			 if(cachedImg.length <= 0) return createImg(id);
			 
			 var result:Image = cachedImg.pop();
			 result.texture = StarlingMain.starlingAssets.getTexture(id);
			 result.readjustSize();
			 return result;
		}
		 
		static public function cacheImage(i:Image):void {
			cachedImg.push(i);
		}
		
	}
}
