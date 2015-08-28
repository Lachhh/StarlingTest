package com.chestapp.meta.rewards {
	import com.chestapp.meta.player.MetaPlayer;
	import com.lachhh.lachhhengine.DataManager;
	import playerio.DatabaseObject;
	import com.lachhh.flash.FlashUtils;
	import com.lachhh.utils.Utils;
	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class MetaReward {
		public var key : String;
		public var value : String;
		public var target : String;
		public var modelReward : ModelReward;
		public var dateCreated:Date;

		public function MetaReward(model:ModelReward) {
			modelReward = model;	
			key = "";
			value = "";
			target = "";
			dateCreated = new Date();
		}
		
		private var saveData : Dictionary = new Dictionary();
				
		public function encode():Dictionary {
			saveData["type"] = modelReward.id;
			saveData["target"] = modelReward.id;
			saveData["value"] = value;
			saveData["dateCreated"] = dateCreated;
			return saveData;
		}
		
		public function decode(loadData:Dictionary):void {
			if(loadData == null) return ;
			modelReward = ModelRewardEnum.getFromId(loadData["type"]);
			value = loadData["value"];
			target = loadData["target"];
			
			if(loadData["dateCreated"] == null){
				dateCreated = new Date();
				dateCreated.setTime(5000);
			}
			else{
				var dbDate:Date = loadData["dateCreated"];
				dateCreated = dbDate;
			}
		}
		
		public function isTargetingAll():Boolean {
			return target == "all";		
		}
		
		public function nameStr():String {
			return modelReward.shortDesc(this);
		}
		
		public function isComsumed(m:MetaPlayer):Boolean {
			return m.hasConsumedReward(this);
		}
		
		public function isCreatedAfterPlayer(m:MetaPlayer):Boolean{
			if(m.accountCreatedDate == null){
				trace("metaPlayer date is null");
				return false;
			}
			return dateCreated.time > m.accountCreatedDate.time;
		}
		
		public function valueAsInt():int {
			return FlashUtils.myParseFloat(value);
		}
		
		static public function creatDummy():MetaReward {
			var result:MetaReward = new MetaReward(ModelRewardEnum.XP);
			result.value = (5000 + Math.random()*10000)+"";
			return result;
		}
		
		static public function createKey(target:String, key:String):MetaReward {
			var result:MetaReward = new MetaReward(ModelRewardEnum.KEY);
			result.value = key;
			result.target = target;
			return result;
		}
		
		static public function createFromDb(db:DatabaseObject):MetaReward {
			var result:MetaReward = new MetaReward(ModelRewardEnum.XP);
			result.decode(DataManager.objToDictionary(db));
			result.key = db.key;
			return result;
		}
		
	}
}
