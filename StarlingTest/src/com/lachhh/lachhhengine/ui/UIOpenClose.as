package com.lachhh.lachhhengine.ui {
	import com.lachhh.lachhhengine.animation.FlashAnimationViewCallback;
	import com.lachhh.io.Callback;
	import com.lachhh.lachhhengine.ui.UIBase;

	/**
	 * @author LachhhSSD
	 */
	public class UIOpenClose extends UIBase {
		
		public var closeStartFrame:int;
		public var callbackOnClose:Callback;
		public var idleCallback:FlashAnimationViewCallback;
		
		public function UIOpenClose(visualId : int, pIdleFrame:int, pCloseStartFrame:int) {
			super(visualId);
			idleCallback = renderComponent.animView.addCallbackOnFrameRepeat(new Callback(onIdle, this, null), pIdleFrame, true);
			
			idleCallback.frame = pIdleFrame;
			closeStartFrame = pCloseStartFrame ; 
		}

		protected function onIdle() : void {
			renderComponent.animView.stop();
		}
		
		public function close():void {
			enableInput(false);
			renderComponent.animView.gotoAndPlay(closeStartFrame);
		}
		
		public function closeWithCallbackOnEnd(callback:Callback):void {
			close();
			if(callback) renderComponent.animView.addEndCallback(callback);
		}

		override public function update() : void {
			super.update();
			checkOnLastFrame();
		}
		
		public function checkOnLastFrame() :void {
			if(renderComponent.animView.loops >= 1) {
				if(callbackOnClose) callbackOnClose.call();
				destroy();
			}
		}
		
		public function isOnIdleFrame():Boolean {
			return renderComponent.animView.getCurrentFrame() == idleCallback.frame;
		}
	}
}
