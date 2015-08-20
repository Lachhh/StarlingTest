package com.lachhh.flash.debug {
	import com.lachhh.lachhhengine.ui.UIBase;
	import com.zombidle.DefaultMainGame;
	import com.zombidle.effect.CallbackTimerEffect;

	import flash.text.TextField;

	/**
	 * @author LachhhSSD
	 */
	public class UIFPSCounter extends UIBase {
		
		public var tf:TextField = new TextField();

		private var fps:int = 0;
		
		public function UIFPSCounter() {
			super(0);
			tf.textColor = 0x888888;
			renderComponent.animView.addChildOnNewParent(DefaultMainGame.UI_CONTAINER_ABOVE);
			visual.addChild(tf);
			visual.mouseChildren = visual.mouseEnabled = false; 
			
			tick();
		
		}
		
		public function show(b:Boolean):void {
			enabled = b;
			visual.visible = b;
		}
		
		public function get isShown():Boolean {
			return enabled;
		}

		override public function update() : void {
			super.update();
			fps++;
		}

		private function tick():void {
			CallbackTimerEffect.addWaitCallFctToActor(this, tick, 1000);
			if(!enabled) return ;
			tf.text = " FPS : " + fps;
			fps = 0;
		}

	}
}
