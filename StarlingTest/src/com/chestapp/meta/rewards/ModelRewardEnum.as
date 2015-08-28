package com.chestapp.meta.rewards {
	/**
	 * @author LachhhSSD
	 */
	public class ModelRewardEnum {
		static private var _id:int = 0 ;
		static public var ALL:Array = new Array();
				
		static public var NULL:ModelReward = new ModelReward("", -1);
		

		static public var XP:ModelReward = create("xp", 1);
		static public var GOLD:ModelReward = create("gold", 2);
		static public var KEY:ModelReward = create("key", 3);
		static public var MSG:ModelReward = create("msg", 4);
		static public var IOU:ModelReward = create("iou", 5);
		static public var CHEST:ModelReward = create("chest", 6);
		
		static public function create(id:String, frame:int):ModelReward {
			var m:ModelReward = new ModelReward(id, frame);
			ALL.push(m);
			return m;
		}
		
		static public function getFromId(id:String):ModelReward {
			for (var i : int = 0; i < ALL.length; i++) {
				var g:ModelReward = ALL[i] as ModelReward;
				if(id == g.id) return g;
			}
			return NULL;
		}
		
		static public function pickRandom():ModelReward {
			var items:Array = ALL;
			var result:ModelReward = (items[Math.floor(Math.random()*items.length)]) as ModelReward; 
			return result;
		} 
		
		static public function getNum():int {
			return _id;
		}
	}
}
