package com.chestapp.meta.raidquestions {
	import com.chestapp.meta.player.MetaPlayer;

	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class MetaPlayerAskQuestion {
		public var metaPlayer:MetaPlayer;
		public var metaQuestion:MetaRaidQuestion;
		
		private var saveData : Dictionary = new Dictionary();

		public function MetaPlayerAskQuestion() {
			metaPlayer = MetaPlayer.createEmpty("");
			metaQuestion = new MetaRaidQuestion();
		}

		public function encode():Dictionary {
			saveData["metaPlayer"] = metaPlayer.encode();
			saveData["metaQuestion"] = metaQuestion.encode();
			return saveData; 
		}
		
		public function decode(loadData:Dictionary):void {
			if(loadData == null) return ;
			metaPlayer = MetaPlayer.createFromDict(loadData["metaPlayer"]);
			metaQuestion = MetaRaidQuestion.createFromDict(loadData["metaQuestion"]); 
		}
		
		static public function create(m:MetaPlayer, metaQuestion:MetaRaidQuestion):MetaPlayerAskQuestion {
			var result:MetaPlayerAskQuestion = new MetaPlayerAskQuestion();
			result.metaPlayer = m;
			result.metaQuestion = metaQuestion;
			return result;
		}
		
		static public function createFromDict(d:Dictionary):MetaPlayerAskQuestion {
			var result:MetaPlayerAskQuestion = new MetaPlayerAskQuestion();
			result.decode(d);
			return result;
		}
	}
}
