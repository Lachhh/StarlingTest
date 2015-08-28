package com.chestapp.meta.server {
	import com.chestapp.meta.player.MetaPlayer;
	import com.lachhh.utils.Utils;
	import com.chestapp.meta.rewards.ModelRewardEnum;
	import playerio.DatabaseObject;
	import com.chestapp.meta.rewards.MetaReward;
	/**
	 * @author LachhhSSD
	 */
	public class MetaDailyChest {
		public var metaReward:MetaReward ;
		public var isEmpty:Boolean;
		public var dateExpire:Date;
		static public var promoText:String = "Empty! Watch twitch.tv/LachhhAndFriends for the next chest!";
		
		public function MetaDailyChest() {
			metaReward = new MetaReward(ModelRewardEnum.CHEST);
		}
		
		public function isClosedAndNotConsumed(m:MetaPlayer):Boolean {
			return isClosed() && !isConsumed(m);
		}
		
		public function isConsumed(m:MetaPlayer):Boolean {
			return (metaReward.isComsumed(m));
		}
		
		public function isClosed():Boolean {
			return !isEmpty && !isExpired();
		}
		
		public function getChestMsg():String {
			if(isEmpty) return promoText;
			if(isExpired()) return promoText;
			return "Open the chest! Quick!\n" + getTimerMSg();
		}
		
		public function getChestMsgWithConsume(meta:MetaPlayer):String {
			if(isEmpty) return promoText;
			if(isExpired()) return promoText;
			if(meta.hasConsumedReward(metaReward)) return promoText;
			return "Open the chest! Quick!\n" + getTimerMSg();
		}
		 
		public function getTimerMSg():String {
			var msDiff:int = getMsDiffWithExpiringDate();
			return Utils.FrameToTimeAdvanced((msDiff/1000)*60, 60, "m", "s");
		}
		
		private function getMsDiffWithExpiringDate():int {
			var now:Date = new Date();
			return dateExpire.time - now.time;
		}
		
		public function isExpired():Boolean {
			return getMsDiffWithExpiringDate() < 0;	
		}
		
		
		
		static public function createDummy():MetaDailyChest {
			var result:MetaDailyChest = new MetaDailyChest();
			return result;
		}
		
		static public function createFakeForAdmin(minutes:int):MetaDailyChest {
			var result:MetaDailyChest = new MetaDailyChest();
			result.dateExpire = new Date();
			result.dateExpire.minutes += minutes;
			result.isEmpty = false;
			return result;
		}
		
		static public function createFromDb(db:DatabaseObject):MetaDailyChest {
			var result:MetaDailyChest = new MetaDailyChest();
			
			if(db == null || db["dateExpire"] == null) {
				result.isEmpty = true;
			} else {
				var dateTest:Date = db["dateExpire"]; 
				result.dateExpire = dateTest;
				result.metaReward.key = db.key;
				result.isEmpty = false;
			}
			return result;
		}
	}
}
