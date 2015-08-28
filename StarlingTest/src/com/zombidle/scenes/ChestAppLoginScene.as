package com.zombidle.scenes {
	import com.chestapp.meta.server.MetaServerProgress;
	import com.chestapp.PlayerIOLachhhRPGController;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.filesystem.File;
	import com.lachhh.io.Callback;
	import com.chestapp.MobileTwitchConnection;
	import com.zombidle.starling.StarlingMain;
	import starling.text.TextField;
	import com.chestapp.ViewChestActor;
	import com.berzerkstudio.MetaCachedGOManager;
	import com.zombidle.starling.StarlingStage;
	import com.berzerkstudio.flash.display.Stage;
	import com.zombidle.starling.DisplayObjectRenderer;
	import com.lachhh.lachhhengine.camera.CameraStarling;
	import com.zombidle.scenes.GameScene;

	/**
	 * @author Shayne
	 */
	public class ChestAppLoginScene extends GameScene {
		
		public var cameraStarling : CameraStarling;
		private var displayObjectRender : DisplayObjectRenderer;
		
		private var chestActor:ViewChestActor;
		
		private var text:TextField;
		
		private var accessToken:String = null;
		
		public function ChestAppLoginScene() {
			super();
		}
		
		public override function start():void{
			super.start();
			
			var s:Stage = new Stage();
			
			cameraStarling = new CameraStarling();
			
			displayObjectRender = new DisplayObjectRenderer();
			displayObjectRender.displayObject = s;
			displayObjectRender.displayObjectContainer = StarlingStage.instance;
			displayObjectRender.start();
			
			chestActor = new ViewChestActor();
			
			var px:Number = StarlingMain.StageWidth;
			var py:Number = StarlingMain.StageHeight;
			
			py += 100;
			
			text = new TextField(px, py, "Loading Twitch...", "BuzzSaw", 24, 0xffffff, false);
			
			StarlingStage.instance.addChild(text);
			
			var token:String = loadTokenFromFile();
			
			if(token == null){
				var mobileTwitchConnection:MobileTwitchConnection = new MobileTwitchConnection();
				mobileTwitchConnection.connectToAuth(new Callback(onTwitchConnected, this, null), new Callback(onError, this, null));
			}
			else{
				onTwitchConnected(token);
			}
		}
		
		public override function update():void{
			super.update();
			chestActor.update();
			displayObjectRender.Draw();
			MetaCachedGOManager.update();
		}
		
		private function setSuccess(name:String):void{
			text.text = "Done!";
			trace(name);
			chestActor.playVictory();
		}
		
		private function onTwitchConnected(token:String):void{
			trace(token);
			writeTokenToFile(token);
			
			text.text = "Connecting to Servers...";
			
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.SecureConnectTwitch(token, new Callback(onLoginSuccess, this, null), new Callback(onLoginError, this, null)); 
		}
		
		private function onLoginSuccess() : void {
			trace("SUCCESS");
			
			text.text = "Connecting to GameRoom...";
			
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectToGameRoom(new Callback(onConnectedToGame, this, null));
		}
		
		private function onLoginError():void{
			onError();
		}
		
		private function onConnectedToGame():void {
			text.text = "Loading character data...";
			
			MetaServerProgress.instance.loadMyCharacter(new Callback(onLoadCharacterComplete, this, null), new Callback(onLoginError, this, null));
		}
		
		private function onLoadCharacterComplete():void {
			setSuccess(PlayerIOLachhhRPGController.getInstance().accountNameWithoutPrefix );
		}
		
		private function loadTokenFromFile():String{
			var file:File = File.applicationStorageDirectory;
			file = file.resolvePath("twitchtoken.txt");
			
			var result:String = null;
			
			if(file.exists){
				var stream:FileStream = new FileStream();
				stream.open(file, FileMode.READ);
				result = stream.readUTFBytes(stream.bytesAvailable);
				stream.close();
			}
			
			return result;
		}
		
		private function writeTokenToFile(token:String):void{
			var file:File = File.applicationStorageDirectory;
			file = file.resolvePath("twitchtoken.txt");
			
			if(!file.exists){
				var stream:FileStream = new FileStream();
				stream.open(file, FileMode.WRITE);
				stream.writeUTFBytes(token);
				stream.close();
			}
		}
		
		private function onError():void{
			text.text = "Error!";
			chestActor.playDead();
		}
	}
}
