package com.zombidle.starling {
	import com.berzerkstudio.flash.display.MovieClip;
	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	import com.berzerkstudio.flash.display.DisplayObject;
	import com.berzerkstudio.flash.display.DisplayObjectContainer;
	import com.lachhh.flash.FlashUtils;
	import com.lachhh.lachhhengine.VersionInfo;

	import flash.geom.Rectangle;
	
	

	/**
	 * @author LachhhSSD
	 */
	public class DisplayObjectView {
		public var debugAnimName : String = "";
		
		public var visual:DisplayObjectContainer;
		public var anim:MovieClip;
		public var animId:String;
		public var x:Number;
		public var y:Number;
		public var scaleX:Number;
		public var scaleY:Number;
		public var rotation:Number;
		
		public var bounds:Rectangle;
			
		private var oldX:Number;
		private var oldY:Number;
		private var oldScaleX:Number;
		private var oldScaleY:Number;
		private var oldRotation : Number;
		private var metaDisplayObject : MetaDisplayObject;
		
		
		
		public function DisplayObjectView(parentVisual : DisplayObjectContainer) {
			visual = parentVisual;
		    anim = null;
		    animId = "";
		    x = 0;
		    y = 0;
		    scaleX = 1;
		    scaleY = 1;
			rotation = 0;
			bounds = new Rectangle();
		}
		
		public function destroy():void { 
		    destroyAnimation();
		}
		
		public function destroyAnimation():void {
		    if(hasAnim()) {
				//recurStop(anim);
				//gotoAndStop(1);
				//stop();
				anim.alpha = 1;
				anim.rotation = 0;
				//Utils.SetColor(anim);
				//AnimationManager.destroy(anim as FlashAnimation);
				//AtlasKnightVisual.cacheImage(anim);
				SymbolManager.CacheDisplayObject(anim);
		        visual.removeChild(anim);
		        anim = null;
		        animId = "";
			}
		}
		
		/*static public function recurStop(mc:MovieClip):void {
			for (var i:int = 0 ; i < mc.numChildren ; i++)	 {
				var m:MovieClip = mc.getChildAt(i) as MovieClip;
				if(m) {
					recurStop(m);
					m.gotoAndStop(1);
				}	
			}
		}
		
		public function recurPlay(mc:MovieClip):void {
			for (var i:int = 0 ; i < mc.numChildren ; i++)	 {
				var m:MovieClip = mc.getChildAt(i) as MovieClip;
				if(m) {
					recurPlay(m);
					m.gotoAndPlay(1);
				}	
			}
		}*/
				
		public function setAnim(idAnim:String):void {
		    if(idAnim != this.animId) {
		        destroyAnimation();
		        this.animId = idAnim;
				debugAnimName = "";
		        if(idAnim != "") {
					metaDisplayObject = MetaFlasAll.KNIGHT_META.GetMetaDisplayObjectFromString(idAnim);
		            anim = SymbolManager.CreateNewSymbol(metaDisplayObject) as MovieClip;
					
					//recurPlay(anim);
		            visual.addChild(anim);
		            bounds.width = anim.width;
		            bounds.height = anim.height;
				    anim.x = x;
				    anim.y = y;
				    anim.scaleX = scaleX;
				    anim.scaleY = scaleY;
				    //anim.stop();
					//isPlaying = (anim.totalFrames > 1);
					//loops = 0;
					if(VersionInfo.isDebug) {
						var a:Array = FlashUtils.mySplit(FlashUtils.myGetQualifiedClassName(anim), "::");
						if(a.length > 0) {
							debugAnimName = "> " + FlashUtils.mySplit(FlashUtils.myGetQualifiedClassName(anim), "::")[1];	
						}
					}   
				}
		        
		        //callbackOnEnd = new Vector.<Callback>();
		       // callbackOnFrame = new Vector.<FlashAnimationViewCallback>();
				//timeLastFrame = GameSpeed.getTime();
			}
		}

		public function update():void {
		    if (!hasAnim()) return; 
		   	
			refresh();
		}
		
		public function refresh():void {
			if (!hasAnim()) return;
			
			refreshPosition();
			refreshScale();
			refreshRotation();
			bounds.x = anim.x;
			bounds.y = anim.y;
		}
		
		private function refreshPosition():void {
			if(x != oldX || y != oldY) {
		        anim.x = x;
				anim.y = y;
		        oldX = x;
		        oldY = y;
			}
		}
		
		private function refreshScale():void {
			if(scaleX != oldScaleX || scaleY != oldScaleY) {
				anim.scaleX = scaleX;
				anim.scaleY = scaleY;
		        oldScaleX = scaleX;
		        oldScaleY = scaleY;
			} 
		}
		
		private function refreshRotation():void {
			while(rotation > 360) rotation -= 360;
			while(rotation < 0) rotation += 360; 
			if(rotation != oldRotation) {
				anim.rotation = rotation;
		        oldRotation = rotation;
			} 
		}
		
		
		
		public function hasAnim():Boolean { 
		    return animId != "";
		}
		
		public function addChildOnNewParent(newParent:DisplayObjectContainer):void {
		    if(hasAnim()) {
		        visual.removeChild(anim);
				newParent.addChild(anim);
			}
			
		    visual = newParent;
		}
		
		public function sendToBack():void {
			visual.addChildAt(anim, 0);
		}
	}
}
