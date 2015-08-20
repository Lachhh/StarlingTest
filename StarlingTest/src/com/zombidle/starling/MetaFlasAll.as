package com.zombidle.starling {
	import flash.xml.XMLNode;
	import com.berzerkstudio.flash.meta.MetaMovieClip;
	import com.berzerkstudio.MetaFla;
	/**
	 * @author LachhhSSD
	 */
	public class MetaFlasAll {
		[Embed(source="../../../../assets/KnightVisuals_Starling_Anim.xml", mimeType="application/octet-stream")]
		public static const KnightVisualsAnimXML : Class;
		
		
		static public var KNIGHT_META:MetaFla = new MetaFla(0);
		static public function init():void {
			var xmlData:Object = new KnightVisualsAnimXML();
			var xmlObject:Object = KnightVisualsAnimXML.data as Object;
			var xml:XML = KnightVisualsAnimXML.data as XML;
			var xmlNode:XMLNode = KnightVisualsAnimXML.data as XMLNode;
			var str:String = xmlData.toString();
			
			//if(xml == null) return ;
			KNIGHT_META.Init(str);
			//KNIGHT_META.Init(xml.toXMLString());
			var mc:MetaMovieClip = KNIGHT_META.GetMetaDisplayObject(0) as MetaMovieClip;
			trace(mc.metaMovieClipFrames[0].metaDisplayObjects[0].theClassName);
			trace("KNIGHT_META : " + KNIGHT_META.GetMetaDisplayObject(34).name + "/" + KNIGHT_META.GetMetaDisplayObject(34).theClassName);  
		}
		
		static public function LoadFromEmbed():void {
			
			//instance.LoadFromXML(xml);
		}
	}
}
