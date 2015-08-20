package com.lachhh.lachhhengine.meta {
	/**
	 * @author LachhhSSD
	 */
	public class ModelBase {
		static public var NULL:ModelBase = new ModelBase(-1);
		public var id : int ;
		

		public function ModelBase(pId:int) {
			id = pId;
		}
		
		public function get isNull():Boolean {
			return id == -1; 
		}
		
		public function toString():String {
			if(isNull) return "null";
			return ""; 
		}
	}
}
