package com.chestapp.meta.player {
	import com.chestapp.constants.GameConstants;
	import com.chestapp.playerio.ModelExternalPremiumAPIEnum;
	import com.chestapp.meta.rewards.ModelRewardEnum;
	import com.chestapp.meta.rewards.MetaReward;
	import playerio.DatabaseObject;

	import com.lachhh.lachhhengine.meta.MetaUpgrade;
	import com.lachhh.utils.Utils;

	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class MetaPlayer {
		
		public var name:String = "DUMMY";
		public var catchPhrase:String = "I have the power!";
		public var xp:MetaUpgrade;
		public var slotSword:MetaEquipSlot;
		public var slotShield:MetaEquipSlot; 
		public var slotHelmet:MetaEquipSlot; 
		public var slotBody:MetaEquipSlot; 
		public var slotArm:MetaEquipSlot;
		public var slotRing:MetaEquipSlot;
		public var allSlots:Array = new Array();
		public var isEmpty:Boolean = false;
		public var isDirty:Boolean = false;
		
		public var accountCreatedDate:Date;
	        
		private var saveData : Dictionary = new Dictionary();
		public var consumedRewardsKey:Array = new Array();
		

		public function MetaPlayer() {
			xp = new MetaUpgrade(GameConstants.PLAYER_LVL);
			slotSword = createSlot(ModelItemGenreEnum.SWORD);
			slotShield = createSlot(ModelItemGenreEnum.SHIELD);
			slotHelmet = createSlot(ModelItemGenreEnum.HELMET);
			slotBody = createSlot(ModelItemGenreEnum.BODY);
			slotArm = createSlot(ModelItemGenreEnum.ARM);
			slotRing = createSlot(ModelItemGenreEnum.RING);
			
			clear();
		}
		
		public function equip(m:MetaItem):void {
			var theSlot:MetaEquipSlot = getSlotFromGenre(m.modelItem.genre); 
			theSlot.equip(m);
			isDirty = true;
		}
		
		public function hasLvlRequired(m:MetaItem):Boolean {
			//return true;
			return (xp.crntLevel >= m.modelItem.lvlNeeded) ;
		}
		
		
		public function canEquip(m:MetaItem):Boolean {
			if(m.isNull()) return false;
			
			var theSlot:MetaEquipSlot = getSlotFromGenre(m.modelItem.genre);
			if(!theSlot.canEquip(m)) return false;
			if(!hasLvlRequired(m)) return false;
			return true;
		}
		
		public function getSlotFromGenre(modelGenre:ModelItemGenre):MetaEquipSlot {
			for (var i : int = 0; i < allSlots.length; i++) {
				var metaEquipSlot:MetaEquipSlot = allSlots[i] as MetaEquipSlot;
				if(metaEquipSlot.modelGenre.id == modelGenre.id) {
					return metaEquipSlot;
				}
			}
			return null;
		}
		
		private function createSlot(modelGenre:ModelItemGenre):MetaEquipSlot {
			var result:MetaEquipSlot = new MetaEquipSlot(modelGenre);
			allSlots.push(result);
			return result;
		}
	
		public function clear():void {
			name = "Dummy";
			catchPhrase = "I have the power!";
			xp.value = 0;
			
			slotSword.equip(new MetaItem(ModelItemEnum.SWORD_1));
			slotHelmet.equip(new MetaItem(ModelItemEnum.HELMET_1));
			slotBody.equip(new MetaItem(ModelItemEnum.BODY_1));
			slotArm.equip(new MetaItem(ModelItemEnum.ARM_1));
			slotShield.equip(new MetaItem(ModelItemEnum.SHIELD_1));
			slotRing.equip(new MetaItem(ModelItemEnum.RING_EMPTY));
			consumedRewardsKey = new Array();
		}
		
		public function encode():Dictionary {
			saveData["name"] = name;
			saveData["xp"] = xp.value;
			saveData["catchPhrase"] = catchPhrase;
			
			saveData["slotSword"] = slotSword.encode();
			saveData["slotHelmet"] = slotHelmet.encode();
			saveData["slotBody"] = slotBody.encode();
			saveData["slotArm"] = slotArm.encode();
			saveData["slotShield"] = slotShield.encode();
			saveData["slotRing"] = slotRing.encode();
			saveData["consumedRewardsKey"] = consumedRewardsKey.slice();
			
			saveData["accountCreatedDate"] = accountCreatedDate;
			return saveData; 
		}
		
		public function decode(loadData:Dictionary):void {
			if(loadData == null) return ;
			if(loadData.name == null) {
				isEmpty = true;
				return ;
			}
			
			isEmpty = false;
			name = loadData["name"];
			xp.value = loadData["xp"];
			catchPhrase = loadData["catchPhrase"];
			
			slotSword.decode(loadData["slotSword"]);
			slotHelmet.decode(loadData["slotHelmet"]);
			slotBody.decode(loadData["slotBody"]);
			slotArm.decode(loadData["slotArm"]);
			slotShield.decode(loadData["slotShield"]);
			slotRing.decode(loadData["slotRing"]);
			
			if(loadData["accountCreatedDate"] == null){
				accountCreatedDate = new Date();
				accountCreatedDate.setTime(1000); // one second later
			}
			else{
				var dbDate:Date = loadData["accountCreatedDate"];
				accountCreatedDate = dbDate;
			}
			
			trace(accountCreatedDate);
			
			Utils.ClearArray(consumedRewardsKey);
			var a:Array = loadData["consumedRewardsKey"] as Array;
			if(a) {
				consumedRewardsKey = a;
			} else {
				var d:Dictionary = loadData["consumedRewardsKey"];
				for each (var str : String in d) {
					consumedRewardsKey.push(str);	
				}
			}
			
			//saveData["consumedRewardsKey"] = consumedRewardsKey;
		}
		
		static public function createDummy():MetaPlayer {
			var result:MetaPlayer = new MetaPlayer();
			
			result.name = "Mister Dummy" + Math.floor(Math.random()*37);
			result.xp.value = result.xp.GetXpNeeded(25);
			result.isEmpty = false;
			
			var frame:int = Math.floor(Math.random()*10); 
			result.slotSword.DEBUGEquipItemFromIndex(frame);
			result.slotShield.DEBUGEquipItemFromIndex(frame);
			result.slotHelmet.DEBUGEquipItemFromIndex(frame);
			result.slotBody.DEBUGEquipItemFromIndex(frame);
			result.slotArm.DEBUGEquipItemFromIndex(frame);
			return result; 
		}
		
		static public function createEmpty(name:String):MetaPlayer {
			var result:MetaPlayer = new MetaPlayer();
			
			result.name = name;
			result.xp.value = 0;
			result.isEmpty = true;
			
			return result; 
		}
		
		static public function createFromDict(d:Dictionary):MetaPlayer {
			var result:MetaPlayer = new MetaPlayer();
			result.decode(d);
			return result;
		}
		
		static public function createDummyList(names:Array):Array{
			var result:Array = new Array();
			for (var i : int = 0; i < names.length; i++) {
				var m:MetaPlayer = MetaPlayer.createDummy();
				m.name = names[i];
				
				result.push(m);
			}
			
			return result; 
		}
		
		public function consumeReward(m:MetaReward):void {
			switch(m.modelReward.id) {
				case ModelRewardEnum.XP.id :
					xp.value += m.valueAsInt();
					break;
			}
			addRewardToConsumed(m);
		}
		
		public function addRewardToConsumed(m:MetaReward):void {
			Utils.AddInArrayIfNotIn(consumedRewardsKey, m.key);
		}
		
		public function hasConsumedReward(m:MetaReward):Boolean {
			return (consumedRewardsKey.indexOf(m.key) != -1);
		}
		
		public function getName():String{
			return name ;// + " : LVL " + xp.crntLevel;
		}
		
		public function getAccountName():String{
			return ModelExternalPremiumAPIEnum.TWITCH.prefixId + name ;// + " : LVL " + xp.crntLevel;
		}
		
		public function getLvlStr():String{
			return "LVL " + xp.crntLevel;
		}
	}
}
