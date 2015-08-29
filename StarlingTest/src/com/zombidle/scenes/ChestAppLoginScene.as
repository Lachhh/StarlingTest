package com.zombidle.scenes {
	import com.zombidle.MainGame;
	import com.chestapp.meta.server.MetaServerProgress;
	import com.chestapp.PlayerIOLachhhRPGController;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.filesystem.File;
	import com.lachhh.io.Callback;
	import com.chestapp.MobileTwitchConnection;
	import com.zombidle.starling.StarlingMain;
	import starling.text.TextField;
	import com.chestapp.ViewLoginCharacterActor;
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
		
		private var loginActor:ViewLoginCharacterActor;
		
		private var statusText:TextField;
		private var isTransitioning:Boolean = false;
		
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
			
			loginActor = new ViewLoginCharacterActor();
			
			var px:Number = StarlingMain.StageWidth;
			var py:Number = StarlingMain.StageHeight;
			
			py += 100;
			
			statusText = new TextField(px, py, "Loading twitch...", "BuzzSaw", 24, 0xffffff, false);
			
			StarlingStage.instance.addChild(statusText);
			
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
			loginActor.update();
			
			if(isTransitioning){
				statusText.y += 5;
			}
			
			displayObjectRender.Draw();
			MetaCachedGOManager.update();
		}
		
		private function heroIsOffScreen():void{
			MainGame.instance.gameSceneManager.loadScene(new CollectChestScene(MetaServerProgress.instance.metaPlayer));
		}
		
		private function heroRunOffScreen():void{
			loginActor.playRunOffScreen(new Callback(heroIsOffScreen, this, null));
			isTransitioning = true;
		}
		
		private function setSuccess(name:String):void{
			statusText.text = "Welcome " + name + "!";
			trace(name);
			loginActor.playVictory();
			loginActor.setAnimFinishedCallback(new Callback(heroRunOffScreen, this, null));
		}
		
		private function onTwitchConnected(token:String):void{
			trace(token);
			writeTokenToFile(token);
			
			statusText.text = "Connecting to Servers...";
			
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.SecureConnectTwitch(token, new Callback(onLoginSuccess, this, null), new Callback(onLoginError, this, null)); 
		}
		
		private function onLoginSuccess() : void {
			trace("SUCCESS");
			
			statusText.text = "Connecting to GameRoom...";
			
			PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectToGameRoom(new Callback(onConnectedToGame, this, null));
		}
		
		private function onLoginError():void{
			onError();
		}
		
		private function onConnectedToGame():void {
			statusText.text = "Loading character data...";
			
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
			statusText.text = "Error!";
			loginActor.playDead();
		}
	}
}
