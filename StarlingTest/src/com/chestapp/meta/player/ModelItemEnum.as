package com.chestapp.meta.player {
	/**
	 * @author LachhhSSD
	 */
	public class ModelItemEnum {
		
		static public var ALL:Array = new Array();
				
		static public var NULL:ModelItem = new ModelItem("", -1, ModelItemGenreEnum.NULL, 0);
		static public var SWORD_1:ModelItem = create("sword_1", 1, ModelItemGenreEnum.SWORD, 1);
		static public var SWORD_2:ModelItem = create("sword_2", 2, ModelItemGenreEnum.SWORD, 5);
		static public var SWORD_3:ModelItem = create("sword_3", 3, ModelItemGenreEnum.SWORD, 10);
		static public var SWORD_4:ModelItem = create("sword_4", 4, ModelItemGenreEnum.SWORD, 15);
		static public var SWORD_5:ModelItem = create("sword_5", 5, ModelItemGenreEnum.SWORD, 20);
		static public var SWORD_6:ModelItem = create("sword_6", 6, ModelItemGenreEnum.SWORD, 25);
		static public var SWORD_7:ModelItem = create("sword_7", 7, ModelItemGenreEnum.SWORD, 30);
		static public var SWORD_8:ModelItem = create("sword_8", 8, ModelItemGenreEnum.SWORD, 35);
		static public var SWORD_9:ModelItem = create("sword_9", 9, ModelItemGenreEnum.SWORD, 40);
		static public var SWORD_10:ModelItem = create("sword_10", 10, ModelItemGenreEnum.SWORD, 45);
		
		static public var HELMET_1:ModelItem = create("helmet_1", 1, ModelItemGenreEnum.HELMET, 1);
		static public var HELMET_2:ModelItem = create("helmet_2", 2, ModelItemGenreEnum.HELMET, 1);
		static public var HELMET_3:ModelItem = create("helmet_3", 3, ModelItemGenreEnum.HELMET, 1);
		static public var HELMET_4:ModelItem = create("helmet_4", 4, ModelItemGenreEnum.HELMET, 3);
		static public var HELMET_5:ModelItem = create("helmet_5", 5, ModelItemGenreEnum.HELMET, 6);
		static public var HELMET_6:ModelItem = create("helmet_6", 6, ModelItemGenreEnum.HELMET, 9);
		static public var HELMET_7:ModelItem = create("helmet_7", 7, ModelItemGenreEnum.HELMET, 12);
		static public var HELMET_8:ModelItem = create("helmet_8", 8, ModelItemGenreEnum.HELMET, 17);
		static public var HELMET_9:ModelItem = create("helmet_9", 9, ModelItemGenreEnum.HELMET, 21);
		static public var HELMET_10:ModelItem = create("helmet_10", 10, ModelItemGenreEnum.HELMET, 24);
		static public var HELMET_11:ModelItem = create("helmet_11", 11, ModelItemGenreEnum.HELMET, 50);
		
		static public var BODY_1:ModelItem = create("body_1", 1, ModelItemGenreEnum.BODY, 1);
		static public var BODY_2:ModelItem = create("body_2", 2, ModelItemGenreEnum.BODY, 1);
		static public var BODY_3:ModelItem = create("body_3", 3, ModelItemGenreEnum.BODY, 1);
		static public var BODY_4:ModelItem = create("body_4", 4, ModelItemGenreEnum.BODY, 3);
		static public var BODY_5:ModelItem = create("body_5", 5, ModelItemGenreEnum.BODY, 6);
		static public var BODY_6:ModelItem = create("body_6", 6, ModelItemGenreEnum.BODY, 9);
		static public var BODY_7:ModelItem = create("body_7", 7, ModelItemGenreEnum.BODY, 12);
		static public var BODY_8:ModelItem = create("body_8", 8, ModelItemGenreEnum.BODY, 17);
		static public var BODY_9:ModelItem = create("body_9", 9, ModelItemGenreEnum.BODY, 21);
		static public var BODY_10:ModelItem = create("body_10", 10, ModelItemGenreEnum.BODY, 24);
		
		static public var ARM_1:ModelItem = create("arm_1", 1, ModelItemGenreEnum.ARM, 1);
		static public var ARM_2:ModelItem = create("arm_2", 2, ModelItemGenreEnum.ARM, 1);
		static public var ARM_3:ModelItem = create("arm_3", 3, ModelItemGenreEnum.ARM, 1);
		static public var ARM_4:ModelItem = create("arm_4", 4, ModelItemGenreEnum.ARM, 3);
		static public var ARM_5:ModelItem = create("arm_5", 5, ModelItemGenreEnum.ARM, 6);
		static public var ARM_6:ModelItem = create("arm_6", 6, ModelItemGenreEnum.ARM, 9);
		static public var ARM_7:ModelItem = create("arm_7", 7, ModelItemGenreEnum.ARM, 12);
		static public var ARM_8:ModelItem = create("arm_8", 8, ModelItemGenreEnum.ARM, 17);
		static public var ARM_9:ModelItem = create("arm_9", 9, ModelItemGenreEnum.ARM, 21);
		static public var ARM_10:ModelItem = create("arm_10", 10, ModelItemGenreEnum.ARM, 24);
		
		static public var SHIELD_1:ModelItem = create("shield_1", 1, ModelItemGenreEnum.SHIELD, 1);
		static public var SHIELD_2:ModelItem = create("shield_2", 2, ModelItemGenreEnum.SHIELD, 2);
		static public var SHIELD_3:ModelItem = create("shield_3", 3, ModelItemGenreEnum.SHIELD, 8);
		static public var SHIELD_4:ModelItem = create("shield_4", 4, ModelItemGenreEnum.SHIELD, 12);
		static public var SHIELD_5:ModelItem = create("shield_5", 5, ModelItemGenreEnum.SHIELD, 16);
		static public var SHIELD_6:ModelItem = create("shield_6", 6, ModelItemGenreEnum.SHIELD, 24);
		static public var SHIELD_7:ModelItem = create("shield_7", 7, ModelItemGenreEnum.SHIELD, 28);
		static public var SHIELD_8:ModelItem = create("shield_8", 8, ModelItemGenreEnum.SHIELD, 32);
		static public var SHIELD_9:ModelItem = create("shield_9", 9, ModelItemGenreEnum.SHIELD, 36);
		static public var SHIELD_10:ModelItem = create("shield_10", 10, ModelItemGenreEnum.SHIELD, 40);
		
		static public var RING_EMPTY:ModelItem = create("ring_empty", 50, ModelItemGenreEnum.RING, 1);
		static public var RING_1:ModelItem = create("ring_1", 1, ModelItemGenreEnum.RING, 10);
		static public var RING_2:ModelItem = create("ring_2", 2, ModelItemGenreEnum.RING, 20);
		static public var RING_3:ModelItem = create("ring_3", 3, ModelItemGenreEnum.RING, 30);
		static public var RING_4:ModelItem = create("ring_4", 4, ModelItemGenreEnum.RING, 40);
		
		
		static public function create(id:String, frame:int, genre:ModelItemGenre, lvl:int):ModelItem {
			var m:ModelItem = new ModelItem(id, frame, genre, lvl);
			if(!getFromId(id).isNull) throw new Error("ENCODE NAME EXIST");
			ALL.push(m);
			return m;
		}
		
		static public function getFromId(id:String):ModelItem {
			for (var i : int = 0; i < ALL.length; i++) {
				var g:ModelItem = ALL[i] as ModelItem;
				if(id == g.id) return g;
			}
			return NULL;
		} 
		
		static public function getFromIndex(id:int):ModelItem {
			if(id >= ALL.length) NULL;
			if(id < 0) NULL;
			var g:ModelItem = ALL[id] as ModelItem;
			return g;
		} 
		
		static public function getNum():int {
			return ALL.length;
		}
		
		
		static public function pickRandomFromGenre(modelGenre:ModelItemGenre):ModelItem {
			var items:Array = getAllModelFromGenre([], modelGenre);
			var result:ModelItem = (items[Math.floor(Math.random()*items.length)]) as ModelItem; 
			return result;
		}
		
		static public function pickFromGenreAndIndex(modelGenre:ModelItemGenre, index:int):ModelItem {
			var items:Array = getAllModelFromGenre([], modelGenre);
			var result:ModelItem = (items[index]) as ModelItem; 
			return result;
		}
		
		static public function getAllModelFromGenre(output:Array, modelGenre:ModelItemGenre):Array {			
			for (var i : int = 0; i < ALL.length; i++) {
				var m:ModelItem = ALL[i] as ModelItem;
				if(m.genre.id == modelGenre.id) {
					output.push(m);
				}
			}
			return output;
		}
		 		
	}
}
