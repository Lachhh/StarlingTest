package com.chestapp.meta.rewards {
	import com.chestapp.meta.ChestAppModelBase;
	import com.lachhh.utils.Utils;

	/**
	 * @author LachhhSSD
	 */
	public class ModelReward extends ChestAppModelBase {
		public var frame : int;

		public function ModelReward(pId : String, pFrame : int) {
			super(pId);
			frame = pFrame;
		}
		
		public function needIntValue():Boolean {
			if(id == ModelRewardEnum.GOLD.id) return true;
			if(id == ModelRewardEnum.XP.id) return true;
			return false; 
		}
		
		public function isOneTimeConsumable():Boolean{;
			return (id == ModelRewardEnum.XP.id || id == ModelRewardEnum.GOLD.id);
		}
		
		public function shortDesc(m:MetaReward):String {
			if(id == ModelRewardEnum.GOLD.id) return Utils.PutVirgules(m.valueAsInt());
			if(id == ModelRewardEnum.XP.id) return Utils.PutVirgules(m.valueAsInt());
			if(id == ModelRewardEnum.MSG.id) return "A message from Lachhh";
			if(id == ModelRewardEnum.IOU.id) return "I.O.U. something...";
			if(id == ModelRewardEnum.KEY.id) return "You got a Steam key!";
			
			return ""; 
		}
	}
}
