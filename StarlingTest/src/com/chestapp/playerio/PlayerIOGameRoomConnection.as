package com.chestapp.playerio {
	import com.chestapp.meta.raidquestions.MetaRaidQuestion;
	import com.chestapp.meta.rewards.MetaReward;
	import com.chestapp.meta.player.MetaPlayer;
	import playerio.Client;
	import playerio.Connection;
	import com.lachhh.io.Callback;

	import flash.utils.Dictionary;

	/**
	 * @author LachhhSSD
	 */
	public class PlayerIOGameRoomConnection extends PlayerIORoomConnection {
		public var saveEquipComplete:PlayerIORoomCommand;
		public var saveEquipError:PlayerIORoomCommand;
		public var consumeRewardComplete:PlayerIORoomCommand;
		public var consumeRewardError:PlayerIORoomCommand;
		
		public var consumeDailyRewardComplete:PlayerIORoomCommand;
		public var consumeDailyRewardError:PlayerIORoomCommand;
		
		public var createRewardSuccess:PlayerIORoomCommand;
		public var createRewardError:PlayerIORoomCommand;
		
		public var refillDailyRewardSuccess:PlayerIORoomCommand;
		public var refillDailyRewardError:PlayerIORoomCommand;
		
		public var playerSendRaidQuestionSuccess:PlayerIORoomCommand;
		public var playerSendRaidQuestionError:PlayerIORoomCommand;
		
		public var adminDeleteAllQuestionsSuccess:PlayerIORoomCommand;
		public var adminDeleteAllQuestionsFailure:PlayerIORoomCommand;
		
		public var playerAskToFavoriteQuestionSuccess:PlayerIORoomCommand;
		public var playerAskToFavoriteQuestionFailure:PlayerIORoomCommand;
		
		public var adminDeleteQuestionSuccess:PlayerIORoomCommand;
		public var adminDeleteQuestionFailure:PlayerIORoomCommand;
		public function PlayerIOGameRoomConnection(pClient : Client, pDebug : Boolean) {
			super(pClient, pDebug);
		}

		override protected function onRoomGameConnected(con : Connection) : void {
			super.onRoomGameConnected(con);
			saveEquipComplete = new PlayerIORoomCommand(this, "saveComplete");
			saveEquipError = new PlayerIORoomCommand(this, "saveError");
			consumeRewardComplete = new PlayerIORoomCommand(this, "comsumeRewardComplete");
			consumeRewardError = new PlayerIORoomCommand(this, "consumeRewardError");
			createRewardSuccess = new PlayerIORoomCommand(this, "adminCreateRewardComplete");
			createRewardError = new PlayerIORoomCommand(this, "adminCreateRewardError");
			refillDailyRewardSuccess = new PlayerIORoomCommand(this, "adminRefillDailyRewardComplete");
			refillDailyRewardError = new PlayerIORoomCommand(this, "adminRefillDailyRewardError");
			
			consumeDailyRewardComplete = new PlayerIORoomCommand(this, "consumeDailyRewardComplete");
			consumeDailyRewardError = new PlayerIORoomCommand(this, "consumeDailyRewardError");
			
			playerSendRaidQuestionSuccess = new PlayerIORoomCommand(this, "playerSendRaidQuestionSuccess");
			playerSendRaidQuestionError = new PlayerIORoomCommand(this, "playerSendRaidQuestionError");
			
			adminDeleteAllQuestionsSuccess = new PlayerIORoomCommand(this, "adminDeleteAllQuestionsSuccess");
			adminDeleteAllQuestionsFailure = new PlayerIORoomCommand(this, "adminDeleteAllQuestionsFailure");
			
			playerAskToFavoriteQuestionSuccess = new PlayerIORoomCommand(this, "playerAskToFavoriteQuestionSuccess");
			playerAskToFavoriteQuestionFailure = new PlayerIORoomCommand(this, "playerAskToFavoriteQuestionFailure");
			
			adminDeleteQuestionSuccess = new PlayerIORoomCommand(this, "adminDeleteQuestionSuccess");
			adminDeleteQuestionFailure = new PlayerIORoomCommand(this, "adminDeleteQuestionFailure");
			
		}
		
		
		public function AskToSave(m:MetaPlayer, success:Callback, errorCallback:Callback):void {
			
			saveEquipComplete.onMsg = success;
			saveEquipError.onMsg = errorCallback;
			connection.send("saveEquipment", m.catchPhrase, 
				m.slotSword.metaItem.modelItem.id,
				m.slotShield.metaItem.modelItem.id,
				m.slotHelmet.metaItem.modelItem.id,
				m.slotBody.metaItem.modelItem.id,
				m.slotArm.metaItem.modelItem.id,
				m.slotRing.metaItem.modelItem.id
				);			
		}


		public function AskToCreateReward(m:MetaReward, success:Callback, errorCallback:Callback):void {
			createRewardSuccess.onMsg = success;
			createRewardError.onMsg = errorCallback;
			connection.send("adminCreateReward", m.target.toLowerCase(), m.modelReward.id, m.value);
		}
	
		public function AskToRefillDailyReward(minutes:int, success:Callback, errorCallback:Callback):void {
			refillDailyRewardSuccess.onMsg = success;
			refillDailyRewardError.onMsg = errorCallback;
			connection.send("adminRefillDailyReward", minutes);
		}
		
		public function AskToConsume(m:MetaReward, success:Callback, errorCallback:Callback):void {
			consumeRewardComplete.onMsg = success;
			consumeRewardError.onMsg = errorCallback;
			connection.send("consumeReward", m.key);			
		}
		
		public function AskToConsumeDailyChest(success:Callback, errorCallback:Callback):void {
			consumeDailyRewardComplete.onMsg = success;
			consumeDailyRewardError.onMsg = errorCallback;
			connection.send("consumeDailyReward");		
		}
		
		public function AskToCreateQuestion(question:MetaRaidQuestion, success:Callback, errorCallback:Callback):void{
			playerSendRaidQuestionSuccess.onMsg = success;
			playerSendRaidQuestionError.onMsg = errorCallback;
			connection.send("playerCreateRaidQuestion", question.userName, question.question);
		}
		
		public function AskToDeleteAllQuestions(success:Callback, failure:Callback):void{
			adminDeleteAllQuestionsSuccess.onMsg = success;
			adminDeleteAllQuestionsFailure.onMsg = failure;
			connection.send("adminDeleteAllQuestions");
		}
		
		public function AskToFavoriteQuestion(metaQuestion:MetaRaidQuestion, success:Callback, failure:Callback):void{
			playerAskToFavoriteQuestionSuccess.onMsg = success;
			playerAskToFavoriteQuestionFailure.onMsg = failure;
			connection.send("playerAskToFavoriteQuestion", metaQuestion.dbKey);
		}

		public function AskToDeleteQuestion(m : MetaRaidQuestion, success : Callback, error : Callback) : void {
			adminDeleteQuestionSuccess.onMsg = success;
			adminDeleteQuestionFailure.onMsg = error;
			connection.send("adminDeleteQuestion", m.dbKey);
		}
	}
}

