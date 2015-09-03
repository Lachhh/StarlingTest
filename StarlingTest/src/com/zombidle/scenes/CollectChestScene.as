package com.zombidle.scenes {
	import flash.geom.Point;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	import flash.geom.Rectangle;
	import starling.events.TouchEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.chestapp.PlayerIOLachhhRPGController;
	import com.chestapp.meta.rewards.ModelRewardEnum;
	import com.chestapp.meta.rewards.MetaReward;
	import playerio.Message;
	import com.chestapp.meta.player.MetaPlayer;
	import com.lachhh.io.Callback;
	import com.chestapp.meta.server.MetaServerProgress;
	import com.chestapp.meta.server.MetaDailyChest;
	import com.berzerkstudio.MetaCachedGOManager;
	import starling.text.TextField;
	import com.zombidle.starling.StarlingMain;
	import com.chestapp.ViewLoginCharacterActor;
	import com.zombidle.starling.StarlingStage;
	import com.berzerkstudio.flash.display.Stage;
	import com.zombidle.starling.DisplayObjectRenderer;
	import com.lachhh.lachhhengine.camera.CameraStarling;
	import com.zombidle.scenes.GameScene;

	/**
	 * @author Shayne
	 */
	public class CollectChestScene extends GameScene {
		
		public static const MSG_LOADING:String = "Loading...";
		public static const MSG_COLLECTING:String = "Consuming...";
		public static const MSG_COLLECTED:String = "You got: ";
		public static const MSG_EMPTY:String = "---";
		public static const MSG_READY:String = "Quick! Collect the chest!";
		public static const MSG_ERROR:String = "Mistakes were made.";
		
		public var cameraStarling : CameraStarling;
		private var displayObjectRender : DisplayObjectRenderer;
		
		private var accountName:String;
		
		private var metaChest:MetaDailyChest;
		private var metaPlayer : MetaPlayer;
		
		private var chestActor:ViewLoginCharacterActor;
		private var beneathText:TextField;
		private var chestTouchRect:Rectangle;
		
		private var isCollecting:Boolean = false;
		
		private var chestInfoText:TextField;
		
		private var refreshTextButton:TextField;
		private var refreshButtonRect:Rectangle;
		
		private var tickTimer:Timer;
		
		private var DEBUG_berzerkTextField:com.berzerkstudio.flash.display.TextField;
		
		public function CollectChestScene(player:MetaPlayer) {
			super();
			
			metaPlayer = player;
			
			var s:Stage = new Stage();
			
			cameraStarling = new CameraStarling();
			
			displayObjectRender = new DisplayObjectRenderer();
			displayObjectRender.displayObject = s;
			displayObjectRender.displayObjectContainer = StarlingStage.instance;
			displayObjectRender.start();
			
			DEBUG_berzerkTextField = new com.berzerkstudio.flash.display.TextField();
			var meta:MetaDisplayObject = new MetaDisplayObject();
			meta.fontName = "BuzzSaw";
			meta.r = 1;
			meta.g = 1;
			meta.b = 1;
			meta.textSize = 24;
			meta.width = 200;
			meta.height = 200;
			meta.text = "I am a berzerk textfield!";
			meta.textAlign = "c";
			DEBUG_berzerkTextField.LoadFromMeta(meta);
			DEBUG_berzerkTextField.x = (StarlingMain.StageWidth / 2) - 400;
			DEBUG_berzerkTextField.y = (StarlingMain.StageHeight / 2);
			s.addChild(DEBUG_berzerkTextField);
			
			chestActor = new ViewLoginCharacterActor();
			chestActor.playIdle();
			
			chestTouchRect = new Rectangle(570,218,126,136);
			
			var px:Number = StarlingMain.StageWidth;
			var py:Number = StarlingMain.StageHeight;
			
			py += 100;
			
			beneathText = new TextField(px, py, "Look at me.\nI am the chest now.", "BuzzSaw", 18, 0xffffff, false);
			
			py = StarlingMain.StageHeight;
			py -= 400;
			
			chestInfoText = new TextField(px, py, MSG_EMPTY, "BuzzSaw", 24, 0xffffff, false);
			
			px = StarlingMain.StageWidth;
			py = StarlingMain.StageHeight;
			py += 300;
			
			refreshTextButton = new TextField(px, py, "REFRESH", "BuzzSaw", 32, 0xffffff, false);
			
			StarlingStage.instance.addChild(beneathText);
			StarlingStage.instance.addChild(chestInfoText);
			StarlingStage.instance.addChild(refreshTextButton);
			
			refreshButtonRect = new Rectangle(588, 495, 107, 28);
			
			tickTimer = new Timer(1000);
			tickTimer.addEventListener(TimerEvent.TIMER, refreshTime);
			tickTimer.start();
			
			StarlingStage.instance.addEventListener(TouchEvent.TOUCH, OnTouch);
			
			loadDailyChest();
		}
		
		public override function start():void{
			super.start();
		}
		
		public override function update():void{
			super.update();
			chestActor.update();
			displayObjectRender.Draw();
			MetaCachedGOManager.update();
		}
		
		private function setAnimToIdle():void{
			chestActor.playIdle();
		}
		
		public function OnTouch(e:TouchEvent):void{
			
			var touch:Touch = e.getTouch(StarlingStage.instance, TouchPhase.BEGAN);
		    if (touch)
		    {
		        var localPos:Point = touch.getLocation(StarlingStage.instance);
				var touchX:Number = localPos.x;
				var touchY:Number = localPos.y;
		        trace("Touched object at position: " + localPos);
				
				if(refreshButtonRect.contains(touchX, touchY)){
						trace("refreshed!");
						loadDailyChest();
				}
				
				if(chestTouchRect.contains(touchX, touchY)){
						trace("touched chest!");
						onClickChest();
				}
		    }
		}
		
		public function loadDailyChest():void {
			chestInfoText.text = MSG_LOADING;
			MetaServerProgress.instance.loadDailyChest(new Callback(onLoaded, this, null), new Callback(onLoadedError, this, null));
		}
		
		private function refreshChest():void {
			//trace("is consumed: " + metaChest.isConsumed(metaPlayer));
			//trace("is closed: " + metaChest.isClosed());
			//trace("is expired: " + metaChest.isExpired());
			if(metaChest.isClosedAndNotConsumed(metaPlayer)) {
				chestActor.playRessurect();
				chestActor.setAnimFinishedCallback(new Callback(setAnimToIdle, this, null));
			} else {
				chestActor.playDead();
			}
		}
		
		public function refresh() : void {
			if(metaChest == null) return;
			chestInfoText.text = metaChest.getChestMsgWithConsume(metaPlayer);
			
			//if(metaChest.isClosedAndNotConsumed(metaPlayer)) {
			//	chestInfoText.text = metaChest.getChestMsgWithConsume(metaPlayer);
			//} else {
			//	chestInfoText.text = MSG_EMPTY;
			//}
		}
		
		private function refreshTime(e:TimerEvent):void {
			if(metaChest == null) return;
			if(metaChest.isEmpty) return ;
			if(metaChest.isConsumed(metaPlayer)) return;
			if(isCollecting) return;
			chestInfoText.text = metaChest.getChestMsgWithConsume(metaPlayer);
		}
		
		private function onLoaded(m:MetaDailyChest):void{
			//chestInfoText.text = MSG_READY;
			metaChest = m;
			refresh();
			refreshChest();
		}
		
		private function onLoadedError():void{
			chestInfoText.text = MSG_ERROR;
		}
		
		private function onClickChest() : void {
			if(!metaChest.isClosedAndNotConsumed(metaPlayer)) {
				return ;
			}
			
			MetaServerProgress.instance.consumeDailyRewardOnDB(new Callback(onConsumeSuccess, this, null), new Callback(onConsumeError, this, null));
			chestInfoText.text = MSG_COLLECTING;
		}

		private function onConsumeSuccess() : void {
			var msg:Message = PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.consumeDailyRewardComplete.msg;
			var xp:int = msg.getInt(0);
			
			var m:MetaReward = new MetaReward(ModelRewardEnum.XP);
			m.value = xp+"";
			m.key = metaChest.metaReward.key;
			
			metaPlayer.addRewardToConsumed(m);
			
			isCollecting = true;
			chestActor.playVictory();
			chestInfoText.text = MSG_COLLECTED + m.value + " XP!";
			chestActor.setAnimFinishedCallback(new Callback(showReward, this, [m]));
		}
		
		private function showReward(m:MetaReward):void {
			//UI_Reward.consumeReward(metaPlayer, m, new Callback(afterShowReward, this, null));
			trace(m.value);
			chestActor.playDead();
			refresh();
			isCollecting = false;
		}
		
		private function afterShowReward():void {
			//promoMc.visible = true;
			//EffectGotoAlpha.addToActorWithSpecificDisplayObj(screen, promoMc, 1);
		}

		private function onConsumeError() : void {
			chestInfoText.text = MSG_ERROR;
			
			var msg:Message = PlayerIOLachhhRPGController.getInstance().mySecuredConnection.connectionGameRoom.consumeDailyRewardError.msg;
			if(msg && msg.length > 0) {
				//UIPopUp.createOkOnly(msg.getString(0), null);
				trace(msg.getString(0));
			}
		}
	}
}
