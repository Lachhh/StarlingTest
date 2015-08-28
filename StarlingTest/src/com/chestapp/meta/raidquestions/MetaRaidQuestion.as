package com.chestapp.meta.raidquestions {
	import com.chestapp.meta.player.MetaPlayer;
	import com.lachhh.utils.Utils;
	import com.lachhh.lachhhengine.DataManager;
	import flash.utils.Dictionary;
	import playerio.DatabaseObject;
	
	/**
	 * @author Shayne
	 */
	public class MetaRaidQuestion {
		public var userName:String = "DUMMY";
		public var question:String = "";
		public var dbKey:String = "";
		public var favoritedBy:Array = new Array();
		public var isFavoritedByClient:Boolean = false;
		public var isClientQuestion:Boolean = false;
		private var saveData : Dictionary = new Dictionary();
		
		public function MetaRaidQuestion(){
			
		}
		
		public function copyFavoritedBy(favoritedBy:Array):void {
			this.favoritedBy = favoritedBy.slice();
		}
		
		public function encode():Dictionary {
			saveData["username"] = userName;
			saveData["question"] = question;
			return saveData; 
		}
		
		public function decode(loadData:Dictionary):void {
			if(loadData == null) return ;
			userName = loadData["username"];
			question = loadData["question"];
			favoritedBy = decodeFavorites(loadData);	
		}
		
		public static function decodeFavorites(data:Dictionary):Array{
			var result:Array = data["favoritedBy"] as Array;
			if(result) return result;
			 
			var d:Dictionary = data["favoritedBy"];
			result = new Array();
			for each (var str : String in d) {
				result.push(str);
			}
			return result;			
		}

		public function getNumFav():int {
			return favoritedBy.length;
		}
		
		public function hasPlayerFavoritedQuestion(accountName:String):Boolean{
			return Utils.IsInArray(favoritedBy, accountName);
		}
		
		public function isQuestionOfPlayer(player:MetaPlayer):Boolean{
			return (player.name.toLowerCase() == userName.toLowerCase());
		}
		
		public function getQuestionWithUserName():String {
			 return userName + " : " + question;
		}
		
		static public function createMetaQuestionFromDBObjects(objects:Array):Array{
			var result:Array = new Array();
			
			var i:int = 0;
			for(i = 0; i < objects.length; i++){
				result.push(MetaRaidQuestion.createFromDBObject(objects[i]));
			}
			
			return result;
		}
		
		static public function create(name:String, question:String):MetaRaidQuestion{
			var result:MetaRaidQuestion = new MetaRaidQuestion();
			result.userName = name;
			result.question = question;
			return result;
		}
		
		static public function createDummy():MetaRaidQuestion{
			var result:MetaRaidQuestion = new MetaRaidQuestion();
			result.userName = "Dummy Name";
			result.question = "What's up with your hair?";
			return result;
		}
		
		static public function createFromDBObject(db:DatabaseObject):MetaRaidQuestion{
			var result:MetaRaidQuestion = MetaRaidQuestion.createFromDict(DataManager.objToDictionary(db));
			result.dbKey = db.key;
			return result;
		}
		
		static public function createFromDict(data:Dictionary):MetaRaidQuestion {
			var result:MetaRaidQuestion = new MetaRaidQuestion();
			result.decode(data);
			return result;
		}

		public function flagQuestionFromClient(mClient : MetaPlayer) : void {
			if(isQuestionOfPlayer(mClient)) isClientQuestion = true;
			if(hasPlayerFavoritedQuestion(mClient.getAccountName())) isFavoritedByClient = true;
		}
	}
}
