package com.chestapp.meta.player {
	import com.chestapp.meta.ChestAppModelBase;
	import com.lachhh.lachhhengine.meta.ModelBase;

	/**
	 * @author LachhhSSD
	 */
	public class ModelItemGenre extends ChestAppModelBase {
		public var iconId:int;
		
		public function ModelItemGenre(pId : String, pIconId:int) {
			super(pId);
			iconId = pIconId;
		}
	}
}
