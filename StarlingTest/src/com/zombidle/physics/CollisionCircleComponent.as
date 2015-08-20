package com.zombidle.physics {
	import com.lachhh.io.KeyManager;
	import com.lachhh.lachhhengine.MyMath;
	import com.lachhh.lachhhengine.VersionInfo;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.camera.CameraFlash;
	import com.lachhh.lachhhengine.components.CollisionComponent;

	import flash.ui.Keyboard;

	/**
	 * @author LachhhSSD
	 */
	public class CollisionCircleComponent extends CollisionComponent {
		static public var teamEnemy:Vector.<CollisionCircleComponent> = new Vector.<CollisionCircleComponent>();
		static public var teamHero : Vector.<CollisionCircleComponent> = new Vector.<CollisionCircleComponent>();
		static public var teamItem : Vector.<CollisionCircleComponent> = new Vector.<CollisionCircleComponent>();
		static public var teamTalk : Vector.<CollisionCircleComponent> = new Vector.<CollisionCircleComponent>();
		static public var teamDoors : Vector.<CollisionCircleComponent> = new Vector.<CollisionCircleComponent>();
		static public var EMPTY_LIST:Vector.<CollisionInfo> = new Vector.<CollisionInfo>();
		public var circles:Vector.<Circle> = new Vector.<Circle>();
		public var circleCol:Circle ;
		private var myTeam:Vector.<CollisionCircleComponent>;
		public var reverseBasedOnRenderer:Boolean = true;
		 
		public function CollisionCircleComponent() {
			super();
			circleCol = addCircleCollision(0,0,1);
		}
		
		override public function update() : void {
			super.update();
			
			if(VersionInfo.isDebug && KeyManager.IsKeyDown(Keyboard.HOME)) {
				for (var i : int = 0; i < circles.length; i++) {
					var circleToCheck:Circle = circles[i];
					var x:int = actor.px+circleToCheck.x*getSide();
					var y:int = actor.py+circleToCheck.y;
					CameraFlash.mainCamera.debugDraw.drawCircle(Circle.toCircleTemp(x, y, circleToCheck.radius), 0x00FF00);
						
				}
			}
		}
		
		public function addToTeam(theTeam:Vector.<CollisionCircleComponent>):void {
			myTeam = theTeam;
			theTeam.push(this);
		}

		override public function destroy() : void {
			super.destroy();
			if(myTeam == null) return ;
			var i:int = myTeam.indexOf(this);
			if(i != -1) myTeam.splice(i, 1);
		}
		
		public function addCircleCollision(x:Number, y:Number, radius:int):Circle {
			var result:Circle = new Circle(x, y, radius);
			circles.push(result);
			return result;
		}
		
		public function isCollidingWithCircle(x:Number, y:Number, radius:Number, vx:Number, vy:Number):CollisionInfo {
			 var squaredRadius:Number = radius*radius;
			 var result:CollisionInfo = CollisionInfo.NULL_COLLISION ;
			 for (var i : int = 0; i < circles.length; i++) {
			 	var circleToCheck:Circle = circles[i];
				var sumRadius:Number = circleToCheck.radius*circleToCheck.radius + squaredRadius;
				var xTotal:int = actor.px+circleToCheck.x*getSide();
				var yTotal:int = actor.py+circleToCheck.y;
				var distBetween:Number = MyMath.distSquared(xTotal, yTotal, x, y);
				
				
				if(distBetween < sumRadius) {
					if(result.isNull) result = new CollisionInfo(actor);
					result.collidedWith.push(circleToCheck);
				} else if(Math.abs(vx) >= 0.1 || Math.abs(vy) >= 0.1) { 
					var tempLine:Line = Line.toLineTemp(x, y, x+vx, y+vy);
					var tempCircle:Circle = Circle.toCircleTemp(xTotal, yTotal, circleToCheck.radius+radius);
					var collisionDetected:Boolean = tempLine.intersectWithCircle(tempCircle);
					if(collisionDetected) {
		                if(result.isNull) result = new CollisionInfo(actor);
						result.collidedWith.push(circleToCheck);
					}
				}
			 }
			 return result;
		}
		
		public function getSide():int {
			if(!reverseBasedOnRenderer) return 1;
			if(actor.renderComponent == null) return 1;
			return (actor.renderComponent.animView.scaleX > 0 ? 1 : -1);
		}
				
		static public function attackTargets(attacker:Actor, targets:Vector.<CollisionCircleComponent>, attackInfo:AttackInfo):Vector.<CollisionInfo> {
			var result:Vector.<CollisionInfo> = EMPTY_LIST;
			for (var i : int = 0; i < targets.length; i++) {
				var theCollisionComponent:CollisionCircleComponent = targets[i];
				if(theCollisionComponent.actor.destroyed) continue;
				if(!theCollisionComponent.enabled) continue;
				var collision:CollisionInfo = theCollisionComponent.isCollidingWithCircle(attackInfo.x, attackInfo.y, attackInfo.radius, attackInfo.vx, attackInfo.vy);
				
				if(!collision.isNull) {
					
					if(result == EMPTY_LIST) result = new Vector.<CollisionInfo>();
					result.push(collision);
					collision.actorAttacking = attacker;
					collision.attackInfo = attackInfo;
					collision.actorCollidedColComponent = theCollisionComponent;
				}
			}
			
			for (var j : int = 0; j < result.length; j++) {
				var collisionInfo:CollisionInfo = result[j];    
				collisionInfo.actorCollidedColComponent.onHitByTarget(collisionInfo);
			}
			
			if(VersionInfo.isDebug && KeyManager.IsKeyDown(Keyboard.HOME)) {
				CameraFlash.mainCamera.debugDraw.drawCircleWithVelocity(Circle.toCircleTemp(attackInfo.x, attackInfo.y, attackInfo.radius), attackInfo.vx, attackInfo.vy, 0xFF0000);
			}
			
			return result;
		}
		
		static public function addToActor(actor : Actor, team:Vector.<CollisionCircleComponent>):CollisionCircleComponent {
			var result:CollisionCircleComponent = new CollisionCircleComponent();
			result.addToTeam(team);
			actor.addComponent(result);
			return result;
		}
	}
}
