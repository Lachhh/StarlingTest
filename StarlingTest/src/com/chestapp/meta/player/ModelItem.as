package com.chestapp.meta.player {
	import com.chestapp.meta.ChestAppModelBase;
	import com.lachhh.lachhhengine.meta.ModelBase;

	/**
	 * @author LachhhSSD
	 */
	public class ModelItem extends ChestAppModelBase {
		public var frame:int = 0;
		public var lvlNeeded:int = 0;
		public var genre:ModelItemGenre= ModelItemGenreEnum.NULL;		
		public function ModelItem(pId : String, pFrame:int, pGenre:ModelItemGenre, pLvl:int) {
			super(pId);
			frame = pFrame;
			genre = pGenre;
			lvlNeeded = pLvl;
		}
		
		
		
		public function lvlNeededStr():String {
			return "LVL : " + lvlNeeded;
		}
	
	}
}
