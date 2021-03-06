package com.zombidle.components {
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.components.ActorComponent;

	import flash.geom.Point;

	/**
	 * @author LachhhSSD
	 */
	public class FollowActorComponent extends ActorComponent {
		public var actorToFollow:Actor;
		public var ease:Point = new Point(5, 20);
		public var offset:Point = new Point();
		public function FollowActorComponent() {
			super();
		}

		override public function update() : void {
			super.update();
			
			var gotoX:int = actorToFollow.px+offset.x;
			var gotoY:int = actorToFollow.py+offset.y;
			 
			actor.px += getMod(actor.px, gotoX, ease.x);
			actor.py += getMod(actor.py, gotoY, ease.y);
		}
		
		private function getMod(value:Number, goto:Number, ease:Number):Number {
			if(Math.abs(goto-value) <= ease) return goto-value;
			if(value > (goto-ease)) {
				return -ease;
			} else if(value < (goto+ease)) {
				return ease;
			} 
			return 0;
		}
		
		static public function addToActor(actor:Actor, actorToFollow:Actor):FollowActorComponent {
			 var result:FollowActorComponent = new FollowActorComponent();
			 result.actorToFollow = actorToFollow;
			 actor.addComponent(result);
			 return result;
		}
		

	}
}
