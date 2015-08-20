package com.zombidle.multilingual {
	/**
	 * @author LachhhSSD
	 */
	public class TextLanguage {
		public var texts:Array = new Array();
		public function addText(id:int, str:String):void {
			texts[id] = str;
		}
	}
}
