package com.lachhh.flash.debug {
	import com.lachhh.io.KeyManager;
	import com.lachhh.lachhhengine.MyMath;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.animation.AnimationFactory;
	import com.lachhh.lachhhengine.camera.CameraFlash;
	import com.lachhh.lachhhengine.components.RenderComponent;
	import com.zombidle.physics.Circle;
	import com.zombidle.physics.Line;

	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.ui.Keyboard;

	/**
	 * @author LachhhSSD
	 */
	public class DebugDraw extends RenderComponent {
		
		private var emptyAnim:MovieClip;
		private var isDirty:Boolean;
		public function DebugDraw(parentVisual : DisplayObjectContainer) {
			super(parentVisual);
			setAnim(AnimationFactory.EMPTY);
			emptyAnim = animView.anim as MovieClip;
			isDirty = false;
			
		}

		override public function update() : void {
			super.update();
			if(KeyManager.IsKeyPressed(Keyboard.HOME)) {
				emptyAnim.visible = true;
			} else if(KeyManager.IsKeyReleased(Keyboard.HOME)) {
				emptyAnim.visible = false;	
			}
			 
			if(isDirty) {
				emptyAnim.graphics.clear();
			}
		}
		
		public function drawLines(lines:Array, color:uint):void {
			for (var i : int = 0; i < lines.length; i++) {
				var crnt:Line = lines[i];
				 drawLine(crnt, color);
			}
		}
		
		public function drawLine(line:Line, color:uint):void {
			if(!canDraw) return ;
			isDirty = true;
			emptyAnim.graphics.lineStyle(2, color, 1); 	
			emptyAnim.graphics.moveTo(line.x1-CameraFlash.mainCamera.px, line.y1-CameraFlash.mainCamera.py);
			emptyAnim.graphics.lineTo(line.x2-CameraFlash.mainCamera.px, line.y2-CameraFlash.mainCamera.py);
		}
		
		
		public function drawCircles(circles:Array, color:uint):void {
			for (var i : int = 0; i < circles.length; i++) {
				var crnt:Circle = circles[i];
				 drawCircle(crnt, color);
			}
		}
		
		public function drawCircle(c:Circle, color:uint):void {
			if(!canDraw) return ;
			isDirty = true;
			emptyAnim.graphics.lineStyle(2, color, 1); 	
			emptyAnim.graphics.drawCircle(c.x-CameraFlash.mainCamera.px, c.y-CameraFlash.mainCamera.py, c.radius);
		}
		
		public function drawCircleWithVelocity(c:Circle, vx:int, vy:int, color:uint):void {
			if(!canDraw) return ;
			if(vx == 0 && vy == 0) {
				drawCircle(c, color);
				return ;
			}
			var rot:int = MyMath.GetRotationFromVelocity(vx, vy);
			var dx:int = MyMath.myCos(rot-90)*c.radius;
			var dy:int = MyMath.mySin(rot-90)*c.radius;
			isDirty = true;
			emptyAnim.graphics.lineStyle(2, color, 1); 	
			emptyAnim.graphics.drawCircle(c.x-CameraFlash.mainCamera.px, 	c.y-CameraFlash.mainCamera.py, c.radius);
			emptyAnim.graphics.drawCircle(c.x-CameraFlash.mainCamera.px+vx, c.y-CameraFlash.mainCamera.py+vy, c.radius);
			
			emptyAnim.graphics.moveTo(c.x+		dx-CameraFlash.mainCamera.px, 	c.y +		dy-CameraFlash.mainCamera.py);
			emptyAnim.graphics.lineTo(c.x+vx+	dx-CameraFlash.mainCamera.px, 	c.y + vy +	dy-CameraFlash.mainCamera.py);
			emptyAnim.graphics.moveTo(c.x-		dx-CameraFlash.mainCamera.px, 	c.y -		dy-CameraFlash.mainCamera.py);
			emptyAnim.graphics.lineTo(c.x+vx-	dx-CameraFlash.mainCamera.px, 	c.y + vy -	dy-CameraFlash.mainCamera.py);
		}
		
		public function get canDraw():Boolean {
			return emptyAnim.visible;
		}
		
		static public function addToActor(actor: Actor, parentVisual:DisplayObjectContainer):DebugDraw {
			var result:DebugDraw = new DebugDraw(parentVisual);
			actor.addComponent(result);
			return result;
		}
		
		static public function getInstance():DebugDraw {
			return CameraFlash.mainCamera.debugDraw;
		}
	}
}
