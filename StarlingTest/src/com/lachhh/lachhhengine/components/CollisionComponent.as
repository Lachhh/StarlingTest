package com.lachhh.lachhhengine.components {
	import com.lachhh.io.Callback;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.zombidle.physics.CollisionInfo;

	/**
	 * @author LachhhSSD
	 */
	public class CollisionComponent extends ActorComponent {
		public var callbackOnCollision:Callback;
		public var collisionInfo:CollisionInfo;
		public function CollisionComponent() {
			super();
		}
		
		public function onHitByTarget(colInfo:CollisionInfo):void {
			collisionInfo = colInfo;
			if(callbackOnCollision) callbackOnCollision.call();
		}
		
	}
}
