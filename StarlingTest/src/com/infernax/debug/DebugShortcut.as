package com.infernax.debug {
	import com.infernax.MainGame;
	import com.lachhh.io.KeyManager;
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.components.ActorComponent;

	import flash.display.StageDisplayState;
	import flash.ui.Keyboard;

	/**
	 * @author LachhhSSD
	 */
	public class DebugShortcut extends ActorComponent {
		public function DebugShortcut() {
			super();
		}

		override public function update() : void {
			super.update();
			if(!VersionInfo.isDebug) return ;
			if(KeyManager.IsKeyPressed(Keyboard.F)) {
				//toggleFullscreen();
			}
		}
		
		static public function toggleFullscreen():void {
			if(MainGame.instance.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE) {
				MainGame.instance.stage.displayState = StageDisplayState.NORMAL;
			} else {
				MainGame.instance.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;	
			}	
		}
	
		
		static public function addToActor(actor: Actor): DebugShortcut {
			var result: DebugShortcut = new DebugShortcut ();
			actor.addComponent(result);
			return result;
		}
	}
}
