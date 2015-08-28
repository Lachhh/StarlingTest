package com.chestapp {
	import com.zombidle.starling.StarlingMain;
	import com.berzerkstudio.flash.display.MovieClip;
	import com.berzerkstudio.flash.display.Stage;
	import com.zombidle.starling.RenderDisplayComponent;
	import com.lachhh.lachhhengine.actor.Actor;
	/**
	 * @author Shayne
	 */
	public class ViewChestActor extends Actor {
		
		public var render:RenderDisplayComponent;
		
		public var loopAnim:Boolean = true;
		
		public function ViewChestActor(){
			super();
			render = addComponent(new RenderDisplayComponent(Stage.instance)) as RenderDisplayComponent;
			
			this.px = StarlingMain.StageWidth / 2;
			this.py = StarlingMain.StageHeight / 2;
			
			playRun();
		}
		
		public function playRun():void{
			loopAnim = true;
			render.animView.setAnim("HERO_RUN");
			(render.animView.anim as MovieClip).gotoAndPlay(0);
		}
		
		public function playVictory():void{
			loopAnim = false;
			render.animView.setAnim("HERO_VICTORY");
			(render.animView.anim as MovieClip).gotoAndPlay(0);
		}
		
		public function playDead():void{
			loopAnim = false;
			render.animView.setAnim("HERO_DIE");
			(render.animView.anim as MovieClip).gotoAndPlay(0);
		}
		
		public function playRessurect():void{
			loopAnim = false;
			render.animView.setAnim("HERO_RESURECT");
			(render.animView.anim as MovieClip).gotoAndPlay(0);
		}
		
		public function playIdle():void{
			loopAnim = true;
			render.animView.setAnim("HERO_IDLE");
			(render.animView.anim as MovieClip).gotoAndPlay(0);
		}
		
		override public function update():void{
			super.update();
			
			var mc:MovieClip = render.animView.anim as MovieClip;
			
			if(mc.currentFrame == mc.totalFrames && !loopAnim){
				mc.stop();
			}
		}
	}
}
