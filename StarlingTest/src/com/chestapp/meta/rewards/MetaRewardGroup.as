package com.chestapp.meta.rewards {
	import playerio.DatabaseObject;
	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class MetaRewardGroup {
		public var metaRewards : Array;
		private var saveData : Dictionary = new Dictionary();

		public function MetaRewardGroup() {
			metaRewards = new Array();
		}
		
		public function add(metaReward:MetaReward):void {
			metaRewards.push(metaReward);
		}
				
		public function encode():Dictionary {
			saveData["metaRewards"] = metaRewards;
			return saveData; 
		}
		
		public function decode(loadData:Dictionary):void {
			if(loadData == null) return ;
			metaRewards = loadData["metaRewards"];
		}
		
		static public function createDummy():Array {
			var result:MetaRewardGroup = new MetaRewardGroup();
			var count:int = 15 + Math.random()*10;
			for (var i : int = 0; i < count; i++) {
				var newReward:MetaReward = MetaReward.creatDummy();
				newReward.key = i+"";
				
				result.add(newReward);
			}
			return result.metaRewards;
		}
		
		static public function createFromDb(rewardsDb:Array):Array {
			var result:MetaRewardGroup = new MetaRewardGroup();
			
			for (var i : int = 0; i < rewardsDb.length; i++) {
				var dbObj:DatabaseObject = rewardsDb[i];
				var newReward:MetaReward = MetaReward.createFromDb(dbObj);
				result.add(newReward);
			}
			return result.metaRewards;
		}
		
	}
}
