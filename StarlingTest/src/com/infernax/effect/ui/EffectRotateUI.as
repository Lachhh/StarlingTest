package com.infernax.effect.ui {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import com.lachhh.lachhhengine.GameSpeed;
	import com.lachhh.lachhhengine.MyMath;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.components.ActorComponent;

	/**
	 * @author LachhhSSD
	 */
	public class EffectRotateUI extends ActorComponent {
		public var rotX:Number = 0;
		public var rotY:Number = 0;
		public var speedRotX:Number = 1;
		public var speedRotY:Number = 1;
		public var xDistance:Number = 30;
		public var yDistance:Number = 15;
		private var vxApplied:Number = 0;
		private var vyApplied:Number = 0;
		private var visual:DisplayObject = null;
		
		public function EffectRotateUI() {
			super();
		}

		override public function start() : void {
			super.start();
			applyChanges();	
		}
		
		override public function update() : void {
			super.update();
			
			cancelPreviousChanges();
			applyChanges();
			calculateNextChanges();	
		}
		
		private function calculateNextChanges():void {
			rotX += speedRotX*GameSpeed.getSpeed();
			rotY += speedRotY*GameSpeed.getSpeed();
			if(rotX > 360) rotX -= 360;
			if(rotY > 360) rotY -= 360;
			if(rotX < 0) rotX += 360;
			if(rotY < 0) rotY += 360;
		}
		
		private function applyChanges():void {
			vxApplied = MyMath.myCos(rotX)*xDistance;
			vyApplied = MyMath.mySin(rotY)*yDistance;
			visual.x += vxApplied;
			visual.y += vyApplied;	
		}
		
		private function cancelPreviousChanges():void {
			visual.x -= vxApplied;
			visual.y -= vyApplied;
		}
		
		override public function destroy() : void {
			super.destroy();
			cancelPreviousChanges();	
		}
		
		static public function addToActor(actor:Actor, visual:DisplayObject):EffectRotateUI {
			var result:EffectRotateUI = new EffectRotateUI();
			result.visual = visual;
			actor.addComponent(result);
			return result;
		}
		
		static public function addToActorAdvanced(actor:Actor, visual:DisplayObject,  distX:Number, distY:Number, speedRotX:Number, speedRotY:Number):EffectRotateUI {
			var result:EffectRotateUI = new EffectRotateUI();
			result.visual = visual;
			result.xDistance = distX;
			result.yDistance = distY;
			result.speedRotX = speedRotX;
			result.speedRotY = speedRotY;
			actor.addComponent(result);
			return result;
		}
	}
}
