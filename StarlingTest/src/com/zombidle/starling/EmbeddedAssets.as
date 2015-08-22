package com.zombidle.starling {
	/**
	 * @author LachhhSSD
	 */
	public class EmbeddedAssets {
		[Embed(source="../../../../assets/textures/1x/KnightVisuals_Starling_Texture.xml", mimeType="application/octet-stream")]
		public static const KnightVisualsXML : Class;
		
		[Embed(source="../../../../assets/textures/1x/KnightVisuals_Starling_Texture.png")]
		public static const KnightVisuals_Starling_Texture : Class;
		
		[Embed(source="../../../../assets/fonts/BuzzSawAOE.ttf", embedAsCFF="false", fontFamily="BuzzSaw")]
		public static const BuzzSawFont : Class;
	}
}
