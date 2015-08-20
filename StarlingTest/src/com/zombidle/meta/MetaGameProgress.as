package com.zombidle.meta {
	import com.lachhh.lachhhengine.DataManager;
	import com.lachhh.lachhhengine.sfx.Jukebox;

	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class MetaGameProgress {
		static public var instance : MetaGameProgress = new MetaGameProgress();
		private static const MAX_FILES : int = 10;
		public var numPlay:int = 0;
		
		public var games:Array = new Array();
		
		private var objData : Dictionary = new Dictionary();
		
		public function MetaGameProgress() {			
			numPlay = 0;
		
		}
		
		public function DEBUGDummyValues():void {
			//Debug game progress here 
			numPlay = 1;
		}
		
		public function clear():void {
			numPlay = 0;
		}
		
		public function encode():Dictionary {
			objData["jukebox"] = Jukebox.getInstance().encode();
			objData["numPlay"] = numPlay;
			
			return objData; 
		}
		
		public function decode(obj:Dictionary):void {
			while(games.length > 0) games.pop();
			var i : int = 0;
		
			Jukebox.getInstance().decode(obj["jukebox"]);
			numPlay = obj["numPlay"];
		}
		
		public function isEmpty():Boolean {
			return (numPlay <= 0) ;
		}
		
		public function hasTooManySaveFiles():Boolean {
			return games.length >= MAX_FILES;
		}
		
		public function hasNoSaveFiles():Boolean {
			return games.length <= 0 ;
		}
		
		public function saveToLocal():void {
			 DataManager.saveLocally(encode());
		}
		
	
		public function loadFromLocal():void {
			if(DataManager.isEmpty) {
				return ;
			}
			
			var d:Dictionary = DataManager.loadLocally() ;
			try {
				decode(d);
			} catch(e:Error) {
				trace("Broken save file,  ignored");
			}
		}
	}
}
