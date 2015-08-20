package com.berzerkstudio.flash.geom {

	/**
	 * @author LachhhSSD
	 */
	public class Color {
		static public var white:Color = new Color(1, 1, 1, 1);
		public var r:Number ;
		public var g:Number ;
		public var b:Number ;
		public var a:Number ;
		public function Color(r:Number, g:Number, b:Number, a:Number) {
			this.r = r;
			this.g = g;
			this.b = b;
			this.a = a;
		}
	}
}
