package com.berzerkstudio.flash.display {
	import com.berzerkstudio.MetaCachedGO;
	import com.berzerkstudio.flash.geom.Transform2D;
	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	import com.lachhh.io.Callback;

	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	public class DisplayObject {
		private var _metaDisplayObject:MetaDisplayObject;
		public var classId:int;
		public var className:String;
		public var parent:DisplayObjectContainer = null ;
		//public var finalMatrix:Matrix4x4;
		public var name:String = "instance";
		public var transform:Transform2D ;
		
		public var nextSibling:DisplayObject ;
		public var prevSibling:DisplayObject ;
		public var isInternal:Boolean = false; // Costruit auto par l'ordi ou non
		public var toBeRemovedInternal:Boolean = false; 
		public var visible:Boolean = true; 
		
		public var mouseEnabled:Boolean = true;
		public var mouseChildren:Boolean = true;
		public var buttonMode:Boolean = false;
		public var useHandCursor:Boolean = false;
		public var mouseX:Number;
		public var mouseY:Number;
		public var childIndex:int;
		
		public var tempNext:DisplayObject;
		public var metaFlaId:int;
		
		public var metaGo:MetaCachedGO = null;
		
		
		public var hitArea:Rectangle = new Rectangle();
		
		//private var _callbackEvents:Array[] = new Array[FlashEvent.NUM_EVENTS];
		
		public var hasMouseEvent:Boolean = false;
		
		//public var graphics:DisplayObjectGraphics = new DisplayObjectGraphics();
		
		
		public var startTextFieldBatch:Boolean = false ;
		public var endTextFieldBatch:Boolean = false ;
		
		public function DisplayObject()  {
			transform = new Transform2D();
			
		}
		
		public function onEnterFrame():void
		{
			
		}
		
		/*protected function onAdded():void {
			
		}
		
		protected function onRemoved():void {
			
		}*/
		
		public function onDraw():void {
			
		}
		
		
		public function LoadFromMeta(m:MetaDisplayObject):void {
			/*for(var i:int = 0 ; i < _callbackEvents.length ; i++) {
				Utils.ClearArray(_callbackEvents[i]);
			}
			*/
			prevSibling = null;
			nextSibling = null;
			startTextFieldBatch = false;
			endTextFieldBatch = false;
			hasMouseEvent = false;
			visible = true;
			mouseEnabled = true;
			mouseChildren = true;
			buttonMode = false;
			useHandCursor = false;
			mouseX = 0;
			mouseY = 0;
			childIndex = 0;
			tempNext = null ;
			//colListener = null;
			metaGo = null;
			parent = null;
			
			name = m.name;
			classId = m.theClassId;
			className = m.theClassName;
			transform.LoadFromTransform(m.transform);
			//transform.colorTransform.LoadFromColorTransform(m.transform.colorTransform);
			_metaDisplayObject = m;
			metaFlaId = m.metaFlaId;
		}
		
		public function getBounds(mc:DisplayObject):Rectangle {
			return null;
		}
		/*
		public function addEventListener(e:MetaFlashEvent, fct:Function):void {
			addEventListener(e, fct, true, 0, false);
		}
		
		public function addEventListener(e:MetaFlashEvent, fct:Function, useCapture:Boolean, priority:int, weakReference:Boolean):void {
			var c:Callback = new Callback(fct, this, null);
			var theArray:Array = GetEventCallbackArray(e) ;
			if(theArray != null) {
				theArray.Push(c);
			}		
			hasMouseEvent = CheckIfHasMouseEvent();
		}
		
		
		public function removeEventListener(e:MetaFlashEvent, fct:Function):void {
			var theArray:Array = GetEventCallbackArray(e) ;
			if(theArray != null) {
				var c:Callback;
				for(var i:int ; i < theArray.length ; i++) {
					c = theArray[i];
					if(c.fct == fct) {
						theArray.splice(i, 1);
						return;
					}
				}
			}	
			hasMouseEvent = CheckIfHasMouseEvent();
		}
		
		public function removeEventListener(e:MetaFlashEvent, fct:Function, useCapture:Boolean):void {
			removeEventListener(e, fct);
		}
		*/
		/*public function CheckIfHasMouseEvent():Boolean {
			if(!mouseEnabled) return false;
			if(_callbackEvents[MouseEvent.MOUSE_DOWN.id] != null && (_callbackEvents[MouseEvent.MOUSE_DOWN.id] as Array).length >= 1) return true;
			if(_callbackEvents[MouseEvent.MOUSE_OVER.id] != null && (_callbackEvents[MouseEvent.MOUSE_OVER.id] as Array).length >= 1) return true;
			if(_callbackEvents[MouseEvent.MOUSE_OUT.id] != null && (_callbackEvents[MouseEvent.MOUSE_OUT.id] as Array).length >= 1) return true;
			if(_callbackEvents[MouseEvent.MOUSE_UP.id] != null && (_callbackEvents[MouseEvent.MOUSE_UP.id] as Array).length >= 1) return true;
			
			return false;
		}*/
		//public function set metaDisplayObject(value:MetaDisplayObject):void{_metaDisplayObject =value;}
		public function get metaDisplayObject():MetaDisplayObject{return _metaDisplayObject ;}
		
		
		public function set alpha(value:Number):void{ transform.colorTransform.alphaColor.a = value;}
		public function get alpha():Number{return transform.colorTransform.alphaColor.a ;}
		
		public function set x(value:Number):void{transform.x = value;}
		public function get x():Number{return transform.x ;}
		
		public function set y(value:Number):void{transform.y = value;}
		public function get y():Number{return transform.y ;}
		
		public function set scaleX(value:Number):void{transform.scaleX = value;}
		public function get scaleX():Number{return transform.scaleX ;}
		
		public function set scaleY(value:Number):void{transform.scaleY = value;}
		public function get scaleY():Number{return transform.scaleY ;}
		
		public function set rotation(value:Number):void{transform.rotation = value;}
		public function get rotation():Number{return transform.rotation ;}
		
		public function set width(value:Number):void{}
		public function get width():Number{return 0 ;}
		
		public function set height(value:Number):void{}
		public function get height():Number{return 0 ;}
		
		public function get regX():Number{return 0 ;}
		public function get regY():Number{return 0 ;}
		
		/*public function GetEventCallbackArray(event:MetaFlashEvent):Array {
			return GetEventCallbackArray(event.id);
		}
		
		public function GetEventCallbackArray(id:int):Array {
			if(id == -1) return null;
			if(_callbackEvents[id] == null) _callbackEvents[id] = new Array();
			return _callbackEvents[id];
		}
		
		public function GetAllMouseDownEvent():Array {
			return GetEventCallbackArray(MouseEvent.MOUSE_DOWN);
		}
		
		public function GetAllMouseUpEvent():Array {
			return GetEventCallbackArray(MouseEvent.MOUSE_UP);
		}
		
		public function GetAllMouseOverEvent():Array {
			return GetEventCallbackArray(MouseEvent.MOUSE_OVER);
		}
		
		public function GetAllMouseOutEvent():Array {
			return GetEventCallbackArray(MouseEvent.MOUSE_OUT);
		}
			*/
		public function localToGlobal(p:Point):Point {
			return p;
		}	
		
		public function get stage():Stage {
			var crntParent:DisplayObjectContainer = parent;
			while(crntParent != null && !(crntParent as Stage)) {
				crntParent = crntParent.parent;
			}
			return crntParent as Stage;
		}
		
		public function get isShape():Boolean{return false ;}
		public function get isTextfield():Boolean{return false ;}
	}
}