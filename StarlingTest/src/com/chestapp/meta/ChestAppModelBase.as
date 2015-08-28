package com.chestapp.meta {
	/**
	 * @author Shayne
	 */
	public class ChestAppModelBase {
		
		public var id : String = "";

		public function ChestAppModelBase(pId:String) {
			id = pId;
		}
		
		public function get isNull():Boolean {
			return id == ""; 
		}
		
	}
}
