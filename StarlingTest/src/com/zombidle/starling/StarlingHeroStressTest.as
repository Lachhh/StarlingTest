package com.zombidle.starling {
	import com.berzerkstudio.flash.display.MovieClip;
	import com.lachhh.lachhhengine.components.PhysicComponent;
	import com.berzerkstudio.flash.display.Stage;
	import com.zombidle.MainGame;
	import com.lachhh.lachhhengine.actor.Actor;

	/**
	 * @author LachhhSSD
	 */
	public class StarlingHeroStressTest extends Actor {
		private var renderStarling : RenderDisplayComponent;
		public function StarlingHeroStressTest() {
			super();
			MainGame.instance.gameSceneManager.gameScene.heroManager.add(this);
			renderStarling = addComponent(new RenderDisplayComponent(Stage.instance)) as RenderDisplayComponent;
			renderStarling.animView.setAnim("HERO_RUN");
			(renderStarling.animView.anim as MovieClip).gotoAndPlay(Math.ceil(Math.random()*10));
			physicComponent = PhysicComponent.addToActor(this);
			physicComponent.vx = Math.random()*5+3;
			physicComponent.gravY = 0;
			py = 100 + Math.random()*600;
		}

		override public function update() : void {
			super.update();
			if(px >= 1400) {
				px = -200;
				py = 100 + Math.random()*600;
			}
		}
	}
}
