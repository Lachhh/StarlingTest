package com.zombidle.starling {
	import flash.ui.Keyboard;
	import com.lachhh.io.KeyManager;
	import com.berzerkstudio.flash.display.Stage;
	import com.lachhh.lachhhengine.actor.Actor;
	import com.lachhh.lachhhengine.components.PhysicComponent;
	import com.zombidle.MainGame;

	/**
	 * @author LachhhSSD
	 */
	public class StarlingHeroTest2 extends Actor {
		private var renderStarling : RenderDisplayComponent;

		public function StarlingHeroTest2() {
			super();
			MainGame.instance.gameSceneManager.gameScene.heroManager.add(this);
			renderStarling = addComponent(new RenderDisplayComponent(Stage.instance)) as RenderDisplayComponent;
			renderStarling.animView.setAnim("HERO_MELEEATTACK01");
			//renderStarling.animView.anim.gotoAndStop(1);
			
			physicComponent = PhysicComponent.addToActor(this);
			physicComponent.vx = 0;
			physicComponent.gravY = 0;
			py = 100 + Math.random()*600;
			px = 300;
		}

		override public function update() : void {
			super.update();
			
			if(KeyManager.IsKeyPressed(Keyboard.LEFT)) {
				
				renderStarling.animView.anim.prevFrame();	
				//trace("FRAME: " + renderStarling.animView.anim.currentFrame);
			}
			
			if(KeyManager.IsKeyPressed(Keyboard.RIGHT)) {
				if(renderStarling.animView.anim.currentFrame >= renderStarling.animView.anim.totalFrames) {
					renderStarling.animView.anim.gotoAndStop(1);	
				} else {
					renderStarling.animView.anim.nextFrame();	
				}
				
				//trace("FRAME: " + renderStarling.animView.anim.currentFrame);
			}
			/*if(px >= 1400) {
				px = -200;
				py = 100 + Math.random()*600;
			}*/
		}
	}
}
