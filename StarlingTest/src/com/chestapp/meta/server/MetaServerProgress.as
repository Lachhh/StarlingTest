package com.chestapp.meta.server {
	import com.chestapp.meta.raidquestions.MetaRaidQuestion;
	import com.chestapp.meta.rewards.MetaReward;
	import com.chestapp.meta.player.MetaFriend;
	import com.chestapp.PlayerIOLachhhRPGController;
	import com.chestapp.meta.rewards.MetaRewardGroup;
	import com.chestapp.meta.player.MetaPlayer;
	import playerio.DatabaseObject;
	import playerio.PlayerIOError;
	import com.lachhh.io.Callback;
	import com.lachhh.lachhhengine.DataManager;

	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class MetaServerProgress {
		static public var instance:MetaServerProgress = new MetaServerProgress();
		
		public var metaPlayer:MetaPlayer ;
		public var metaRewards : MetaRewardGroup;
		public var metaQuestions : MetaRaidQuestionGroup = new MetaRaidQuestionGroup();
		public var metaDailyChest:MetaDailyChest;
		public var firstTimeLoggingIn:Boolean = false;
		
		public function clear():void {
			metaPlayer = new MetaPlayer();
			metaRewards = new MetaRewardGroup();
			metaQuestions = new MetaRaidQuestionGroup();
			metaDailyChest = new MetaDailyChest();
		}
		
		public function saveMyCharacter(success:Callback, error:Callback):void {
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToSave(metaPlayer, success, error);
		}
		
		public function loadMyCharacter(success:Callback, error:Callback):void {
			if(!PlayerIOLachhhRPGController.getInstance().mySecuredConnection.loggedIn) {
				return ;
			}
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.LoadMyData(new Callback(onLoadMyCharacter, this, [success, error]), error);
		}
		
		public function onLoadMyCharacter(success:Callback, errorCallback:Callback):void {
			var objData:Object = PlayerIOLachhhRPGController.getInstance().mySecuredConnection.myPlayerObject;
			metaPlayer = new MetaPlayer();
			var hasData:Boolean = (objData.name != null);
			 
			if(hasData) {
				//try {
					var metaPlayerDict:Dictionary = DataManager.objToDictionary(objData);
					metaPlayer.decode(metaPlayerDict);
				//} catch(e:Error) {
					//if(errorCallback) errorCallback.call();
					//return ;
				//}
			} else {
				metaPlayer.name = PlayerIOLachhhRPGController.getInstance().accountNameWithoutPrefix;
				firstTimeLoggingIn = true;
			}
			if(success) success.call();
		}
		
		public function loadCharacters(metaFriends:Array, success:Callback):void {
			var newArray:Array = new Array();
			for (var i : int = 0; i < metaFriends.length; i++) {
				var m:MetaFriend = metaFriends[i];
				m.loadingError = 0;
				newArray.push(m);
			}
			loadNextCharacter(newArray, success);
		}
		
		public function loadCharacterData(m:MetaFriend, success:Callback, error:Callback):void {	
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.LoadCharacterData(m, success, error);
		}
		
		private function loadNextCharacter(a:Array, success:Callback):void {
			if(a.length <= 0) {
				if(success) success.call();
				return;
			}
			
			var m:MetaFriend = a.shift(); 
				
			loadCharacterData(m, new Callback(loadNextCharacter, this, [a, success]), 
				new Callback(
					function():void {
						if(m.loadingError < 3) {
							a.push(m);
							m.loadingError++; 
						}
						loadNextCharacter(a, success) ;
					}, this, null
				)
			);
		}
		
		public function consumeRewardOnDB(m:MetaReward, success:Callback, error:Callback):void {
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToConsume(m, success, error);
		}
		
		public function consumeDailyRewardOnDB(success:Callback, error:Callback):void {
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToConsumeDailyChest(success, error);
		}
		
		public function deleteQuestion(m:MetaRaidQuestion, success:Callback, error:Callback):void {
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToDeleteQuestion(m, success, error);
		}
		
		public function createBunchOfRewardOnDB(metaRewards:Array, success:Callback, error:Callback):void {
			createBunchOfRewardOnDB_processOne(metaRewards.slice(), success, error);
		}
		
		private function createBunchOfRewardOnDB_processOne(metaRewards:Array, success:Callback, error:Callback):void {
			 if(metaRewards.length <= 0) {
				if(success) success.call();
			 } else {
				var m:MetaReward = metaRewards.shift();
				trace("Sending Reward for... " + m.target);
				createRewardOnDB(m, new Callback(createBunchOfRewardOnDB_processOne, this, [metaRewards, success, error]), new Callback(createBunchOfRewardOnDB_error, this, [metaRewards, m, success, error]));
				
			 }
		}
		
		private function createBunchOfRewardOnDB_error(metaRewards:Array, m:MetaReward, success:Callback, error:Callback):void {
			metaRewards.push(m);
			trace("Error Trying to create reward for : " + m.target + "/ Trying again...");
			createBunchOfRewardOnDB(metaRewards, success, error);
		}
		
		
		
		public function createRewardOnDB(m:MetaReward, success:Callback, error:Callback):void {
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToCreateReward(m, success, error);
		}
		
		public function loadRewardOnDB(success:Callback, error:Callback):void {
			 if(!PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connected) return ;
			 
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.client.bigDB.loadRange("rewards", "ByTarget", [PlayerIOLachhhRPGController.getInstance().mySecuredConnection.myAccountName], null, null, 1000, 
			 function(rewards:Array):void {
				trace(rewards);
				PlayerIOLachhhRPGController.getInstance().mySecuredConnection.client.bigDB.loadRange("rewards", "ByTarget", ["all"], null, null, 1000, 
					function(rewardsForAll:Array):void {
						var allRewards:Array = rewardsForAll.concat(rewards); 
						var metaRewards:Array = MetaRewardGroup.createFromDb(allRewards);
						if(success) success.callWithParams([metaRewards]);
					 }, function(e:PlayerIOError):void {
						if(error) error.call();
					 }	);
				//if(success) success.call();
			 }, function(e:PlayerIOError):void {
				if(error) error.call();
			 }
			 
			 );
		}
		
		public function loadDailyChest(success:Callback, error:Callback):void {
			if(!PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connected) return ;
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.client.bigDB.loadSingle("rewards", "ByDailyChest", ["chest"],
			 	function(dailyReward:DatabaseObject):void {
					var metaRewards:MetaDailyChest = MetaDailyChest.createFromDb(dailyReward);
					if(success) success.callWithParams([metaRewards]);
				 }, function(e:PlayerIOError):void {
					
					if(error) error.call();
				 });
			
		}
		
		public function refillDailyRewardOnDB(minutes:int, success:Callback, error:Callback):void {
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToRefillDailyReward(minutes, success, error);
		}
		
		public function createQuestionOnDB(question:MetaRaidQuestion, success:Callback, error:Callback):void{
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToCreateQuestion(question, success, error);
		}
		
		public function loadQuestionsOnDB(success:Callback, failure:Callback):void{
			if(!PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connected) return ;
			 
			 trace("loading questions");
			 
			 PlayerIOLachhhRPGController.getInstance().mySecuredConnection.client.bigDB.loadRange("Questions", "GetAll", ["loadAllValues"], null, null, 1000,
			 function(dbObjects:Array):void {
				var questions:Array = MetaRaidQuestion.createMetaQuestionFromDBObjects(dbObjects);
				
				if(success) success.callWithParams([questions]);
				
			 }, function(e:PlayerIOError):void {
				if(failure) failure.call();
			 }
			 
			 );
		}
		
		public function deleteAllQuestionsInDB(success:Callback, failure:Callback):void {
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToDeleteAllQuestions(success, failure);
		}
		
		public function favoriteQuestion(metaQuestion:MetaRaidQuestion, success:Callback, failure:Callback):void{
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.AskToFavoriteQuestion(metaQuestion, success, failure);
		}
	}
}
