package com.lachhh.lachhhengine.ui {
	import flash.events.MouseEvent;
	import com.lachhh.io.Callback;
	import com.lachhh.lachhhengine.ActorObjectManager;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.components.RenderComponent;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	/**
	 * @author LachhhSSD
	 */
	public class UIBase extends Actor {
		static public var manager:ActorObjectManager = new ActorObjectManager();
		static public var defaultUIContainer:DisplayObjectContainer ;
		
		public var visual:MovieClip; 
		
		private var metaCallbacks:Vector.<MetaCallbackOnClickUI> = new Vector.<MetaCallbackOnClickUI>();
		public var isListeningToInput:Boolean;
		
		public function UIBase(visualId:int) {
			super();
			manager.debugName = "Screens";
			manager.add(this);
			
			renderComponent = RenderComponent.addToActor(this,  defaultUIContainer, visualId);

			visual = renderComponent.animView.anim;
			isListeningToInput = true;
		}
		
		override public function destroy() : void {
			super.destroy();
			enableInput(false);
		}
		
		
		public function registerClick(pVisual:DisplayObject, fctOnClick:Function):MetaCallbackOnClickUI {
			return registerClickWithCallback(pVisual, new Callback(fctOnClick, null, null));
		}
		
		public function registerClickWithCallback(pVisual:DisplayObject, fctOnClick:Callback):MetaCallbackOnClickUI {
			var metaClick:MetaCallbackOnClickUI = new MetaCallbackOnClickUI(pVisual, MouseEvent.MOUSE_DOWN, fctOnClick);
			metaCallbacks.push(metaClick);
			return metaClick;
		}
		
		public function registerEventWithCallback(pVisual:DisplayObject, eventType:String, fctOnEvent:Callback):MetaCallbackOnClickUI {
			var metaClick:MetaCallbackOnClickUI = new MetaCallbackOnClickUI(pVisual, eventType, fctOnEvent);
			metaCallbacks.push(metaClick);
			return metaClick;
		}
		
		public function registerEvent(pVisual:DisplayObject, eventType:String, fctOnEvent:Function):MetaCallbackOnClickUI {
			return registerEventWithCallback(pVisual, eventType, new Callback(fctOnEvent, null, null));
		}
		
		public function removeEventFromVisual(visual:DisplayObject):void {
			for (var i : int = 0; i < metaCallbacks.length; i++) {
				var metaClick:MetaCallbackOnClickUI = metaCallbacks[i];
				if(metaClick.visual == visual) {
					metaCallbacks.splice(i, 1);
					metaClick.enable(false);
					i--;
				}
			}
		}
		
		public function enableInputOfButton(btn:DisplayObject, b:Boolean):void {
			for (var i : int = 0; i < metaCallbacks.length; i++) {
				var metaClick:MetaCallbackOnClickUI = metaCallbacks[i];
				if(metaClick.visual == btn) {
					metaClick.enable(b);
				}
			}
		}
		
		
		public function enableInput(b:Boolean):void {
			isListeningToInput = b;
			for (var i : int = 0; i < metaCallbacks.length; i++) {
				var metaClick:MetaCallbackOnClickUI = metaCallbacks[i];
				metaClick.enable(b);
			}
		}
		
		public function doEventFromVisual(eventType:String, visual:DisplayObject):void {
			for (var i : int = 0; i < metaCallbacks.length; i++) {
				var metaClick:MetaCallbackOnClickUI = metaCallbacks[i];
				if(!metaClick.isEnabled) continue;
				if(metaClick.visual != visual) continue;
				if(metaClick.eventType != eventType) continue;
				metaClick.call();
			}
		}
		
	}
}
