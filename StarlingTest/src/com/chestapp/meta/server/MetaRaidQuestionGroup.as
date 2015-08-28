package com.chestapp.meta.server {
	import com.chestapp.meta.player.MetaPlayer;
	import com.chestapp.meta.raidquestions.MetaRaidQuestion;
	import com.lachhh.utils.Utils;
	import playerio.DatabaseObject;

	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class MetaRaidQuestionGroup {
		public var metaRaidQuestions : Array;
		private var saveData : Dictionary = new Dictionary();

		public function MetaRaidQuestionGroup() {
			metaRaidQuestions = new Array();
		}
		
		public function flagQuestionFromClient(mClient:MetaPlayer):void {
			for (var i : int = 0; i < metaRaidQuestions.length; i++) {
				var mQuestion:MetaRaidQuestion = metaRaidQuestions[i];
				mQuestion.flagQuestionFromClient(mClient);
			} 	
		}
		
		public function clear():void {
			Utils.ClearArray(metaRaidQuestions);
		}
		
		public function copyFrom(metaQuestions:Array):void {
			clear();
			for (var i : int = 0; i < metaQuestions.length; i++) {
				var newReward:MetaRaidQuestion = metaQuestions[i];
				add(newReward);
			}
		}
		
		
		public function add(metaReward:MetaRaidQuestion):void {
			metaRaidQuestions.push(metaReward);
		}
				
		public function encode():Dictionary {
			saveData["metaRaidQuestions"] = metaRaidQuestions;
			return saveData; 
		}
		
		public function decode(loadData:Dictionary):void {
			if(loadData == null) return ;
			metaRaidQuestions = loadData["metaRaidQuestions"];
		}
		
		public function getNumFavByClient():int {
			var result:int = 0;
			for (var i : int = 0; i < metaRaidQuestions.length; i++) {
				var m:MetaRaidQuestion = metaRaidQuestions[i];
				if(m.isFavoritedByClient) result++;
			}
			return result;
		}
		
		static public function createDummy():Array {
			var result:MetaRaidQuestionGroup = new MetaRaidQuestionGroup();
			var count:int = 15 + Math.random()*10;
			for (var i : int = 0; i < count; i++) {
				var newRaidQuestion:MetaRaidQuestion = MetaRaidQuestion.createDummy();
				newRaidQuestion.dbKey = i+"";
				
				result.add(newRaidQuestion);
			}
			return result.metaRaidQuestions;
		}
		
		static public function createFromDb(rewardsDb:Array):Array {
			var result:MetaRaidQuestionGroup = new MetaRaidQuestionGroup();
			
			for (var i : int = 0; i < rewardsDb.length; i++) {
				var dbObj:DatabaseObject = rewardsDb[i];
				var newReward:MetaRaidQuestion = MetaRaidQuestion.createFromDBObject(dbObj);
				result.add(newReward);
			}
			return result.metaRaidQuestions;
		}
		
		static public function sortListByNum(metaQuestion:Array):void {
			metaQuestion.sort(sortListByNumFct);
		}
		
		static public function sortListByNumFct(a:MetaRaidQuestion, b:MetaRaidQuestion):int {
			if(a.getNumFav() < b.getNumFav()) return 1;
			if(a.getNumFav() > b.getNumFav()) return -1;
			return 0;
		}
	}
}
