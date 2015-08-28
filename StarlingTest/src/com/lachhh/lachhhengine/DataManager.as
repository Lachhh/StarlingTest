package com.lachhh.lachhhengine {
	import com.lachhh.io.Callback;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.media.Sound;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.SharedObject;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	/**
	 * @author LachhhSSD
	 */
	public class DataManager {
		static private var _loadFileCallback:Callback;
		static public var loadFile:FileReference;
		static public var soundLoaded:Sound;
		static public var soundLoadedCallback:Callback;
		static private var GAME_NAME:String = "GAME";
		static private var DATANAME:String = "GAMEDATA_FGL";
		static private var _sharedObject:SharedObject = SharedObject.getLocal(GAME_NAME);
		static public var isEmpty:Boolean = (_sharedObject.data[DATANAME] == "" || _sharedObject.data[DATANAME] == null);
		
		static public function save(string:String):void {
			_sharedObject.data[DATANAME] = string;
		 	_sharedObject.flush();
		}
		
		static private function loadSharedObject():String {
			return _sharedObject.data[DATANAME];
		}
		
		static public function loadLocally():Dictionary {
			return stringToDictionnary(DataManager.loadSharedObject());
		}
		
		static public function saveLocally(d:Dictionary):void {
			var obj:Object = dictToObject(d); 
			save(JSON.stringify(obj));
		}
		
		static private function stringToJSON(string:String):Object {
			return JSON.parse(string);
		}
		
		static public function stringToDictionnary(string:String):Dictionary {
			return objToDictionary(stringToJSON(string));
		}
		
		static public function objToDictionary(obj:Object):Dictionary {
			var result:Dictionary = new Dictionary();
			for (var index : String in obj) {
				var child:Object = obj[index];
				switch(true) {
					case child is Number :
					case child is int :  
					case child is String : 
					case child is Date : 
					case child is Boolean : result[index] = child; break;
					case child is Object : result[index] = objToDictionary(child); break;  
				}
			}
			return result;
		}
		
		static public function dictToObject(obj:Dictionary):Object{
			var result:Object = new Object();
			for (var index : String in obj) {
				var child:Object = obj[index];
				switch(true) {
					case child is Number :
					case child is int :  
					case child is String : 
					case child is Date : 
					case child is Boolean : result[index] = child; break;
					case child is Dictionary : result[index] = dictToObject(child as Dictionary); break;  
				}
			}
			return result;
		}
		
		
		static public function saveToFile(d:Dictionary):void {
			var obj:Object = dictToObject(d); 
			var result:String = (JSON.stringify(obj));
			var fr:FileReference = new FileReference();
			fr.save(result, "JSB_Level.txt");
		}
		
		static public function loadJsFile(urlJS:String, onFinish:Callback):void {
			_loadFileCallback = onFinish;
			loadFile = new File() ;
			loadFile.addEventListener(Event.COMPLETE, onLoadJSComplete);
			loadFile.load();
		}
		
		static public function selectJsFileToLoad(onFinish:Callback):void {
			_loadFileCallback = onFinish;
			loadFile = new FileReference();
			loadFile.addEventListener(Event.SELECT, onSelectFile);
			var fileFilter:FileFilter = new FileFilter("Txt", "*.txt");
			loadFile.browse([fileFilter]);
		}

		private static function onSelectFile(event : Event) : void {
			loadFile.removeEventListener(Event.SELECT, onSelectFile);
			loadFile.addEventListener(Event.COMPLETE, onLoadJSComplete);
		    loadFile.load();
		}

		private static function onLoadJSComplete(event : Event) : void {
			loadFile.removeEventListener(Event.COMPLETE, onLoadJSComplete);
		    if(_loadFileCallback) _loadFileCallback.call();		    
		}
		
		static public function loadSong(url:String, onFinish:Callback):void {
			soundLoadedCallback = onFinish;
			var s:Sound = new Sound(); 
			s.addEventListener(Event.COMPLETE, onSoundComplete); 
			var req:URLRequest = new URLRequest(url); 
			s.load(req);
		}
		
		static private function onSoundComplete(event : Event) : void {
			soundLoaded = (event.target as Sound);
			if(soundLoadedCallback) soundLoadedCallback.call();			
		}
		
		static public function cloneDict(original:Dictionary):Dictionary {
		    var cloned:Dictionary = new Dictionary();
		    for(var key:Object in original) {
		      if( original[key]  is Dictionary)
		         cloned[key] = cloneDict(original[key]);
		      else
		         cloned[key] = original[key];
		    }
		    return cloned;
		}
	}
}
