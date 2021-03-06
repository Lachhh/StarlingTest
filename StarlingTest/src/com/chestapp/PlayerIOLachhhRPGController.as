package com.chestapp {
	import com.chestapp.playerio.*;
	import com.lachhh.io.Callback;

	import flash.display.DisplayObject;
	import flash.system.Security;

	/**
	 * @author Lachhh
	 */
	public class PlayerIOLachhhRPGController {
		static private var PIO_ID:String = "lachhhandfriendsrpg-5fyupzvaj06omhuc2smjuq";
	
		static private var _instance:PlayerIOLachhhRPGController;
		static private var _modelExternsalAPI:ModelExternalPremiumAPI;
		
		private var _myPublicConnection:PlayerIOConnectionPublic;
		private var _mySecuredConnection:PlayerIOConnectionSecure;
		private var _myFriendsController:PlayerIOFriendsController;
		
		public function PlayerIOLachhhRPGController(root:DisplayObject, modelExternsalAPI:ModelExternalPremiumAPI, debugMode:Boolean) {
			_modelExternsalAPI = modelExternsalAPI;
			
			_mySecuredConnection = new PlayerIOConnectionSecure(PIO_ID, root, debugMode, "SECURED");
			_myPublicConnection	= new PlayerIOConnectionPublic(PIO_ID, root, debugMode, "PUBLIC");
			_myFriendsController = new PlayerIOFriendsController(_mySecuredConnection, modelExternsalAPI);
			
			_myPublicConnection.PublicConnect(null, null);
			
			
			//Security.allowDomain("*") ;
			//Security.allowDomain("playerio.com") ;
		}
		
			
		public function get nameOfSystem() : String {
			return "PlayerIO";
		}
		
		public function get accountNameWithoutPrefix() : String {
			return ModelExternalPremiumAPIEnum.RemovePrefixFromModel(mySecuredConnection.myAccountName, _modelExternsalAPI);
		}
		
		static public function getInstance():PlayerIOLachhhRPGController {
			return _instance;
		}

		static public function InitInstance(root:DisplayObject, modelExternal:ModelExternalPremiumAPI, debugMode:Boolean):void {
			if(_instance == null) {
				_instance = new PlayerIOLachhhRPGController(root, modelExternal, debugMode); 
			}	
		}
		
		public function get mySecuredConnection() : PlayerIOConnectionSecure {return _mySecuredConnection;}		
		public function get myPublicConnection() : PlayerIOConnection {return _myPublicConnection;}		
		public function get myFriendsController() : PlayerIOFriendsController {	return _myFriendsController;}		
	}
}
