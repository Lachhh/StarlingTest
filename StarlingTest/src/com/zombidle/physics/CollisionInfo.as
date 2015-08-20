package com.zombidle.physics {
	import com.lachhh.lachhhengine.actor.Actor;
	/**
	 * @author LachhhSSD
	 */
	public class CollisionInfo {
		static public var NULL_COLLISION:CollisionInfo = new CollisionInfo(null);
		public var actorCollided:Actor ;
		public var actorCollidedColComponent:CollisionCircleComponent ;
		public var actorAttacking:Actor ;
		public var attackInfo:AttackInfo ;
		public var collidedWith : Vector.<Circle> = new Vector.<Circle>();
		public var isNull:Boolean = false;
		public function CollisionInfo(pActorCollided:Actor) {
			actorCollided = pActorCollided;
			isNull = (actorCollided == null);
		}
		
		

	}
}
