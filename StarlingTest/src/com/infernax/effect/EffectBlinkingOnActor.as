package com.infernax.effect {
	import com.lachhh.lachhhengine.actor.Actor;

	/**
	 * @author Lachhh
	 */
	public class EffectBlinkingOnActor extends EffectBlinking {

		override public function update() : void {
			super.update();
			if(actor.renderComponent.animView.hasAnim()) visualToBlink = actor.renderComponent.animView.anim;
			
		}
	
		static public function addToActor(actor:Actor, blinkingTime:int, color:uint):EffectBlinkingOnActor {
			var result:EffectBlinkingOnActor = new EffectBlinkingOnActor();
			result.blinkingTime = blinkingTime;
			result.color = color;
			result.visualToBlink = actor.renderComponent.animView.anim;
			actor.addComponent(result);
			
			return result;
		}		
	}
}
