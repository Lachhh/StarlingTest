package com.zombidle.starling {
	import com.berzerkstudio.MetaCachedGOManager;
	import com.berzerkstudio.MetaFla;
	import com.berzerkstudio.flash.display.DisplayObject;
	import com.berzerkstudio.flash.display.DisplayObjectContainer;
	import com.berzerkstudio.flash.display.MovieClip;
	import com.berzerkstudio.flash.display.ShapeObject;
	import com.berzerkstudio.flash.display.TextField;
	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	public class SymbolManager {
		
		static public var metaFlas:Vector.<MetaFla>;
		static public var metaFlasToLoad:Vector.<String>;
		static public var metaFlasLoadedIndex:int = 0;
		
		
		static private var _cachedMovieClip:Vector.<MovieClip> = new Vector.<MovieClip>();
		//private var _cachedButtonSelect:ButtonSelectArray = new Vector.<Button>();
		//private var _cachedAnimationAsset:AnimationAssetArray = new Vector.<MovieClip>();
		static private var _cachedShapeObject:Vector.<ShapeObject> = new Vector.<ShapeObject>();
		static private var _cachedTextField:Vector.<TextField> = new Vector.<TextField>();
		
		
	
		
		static public function GetMetaDisplayObject(idFla:int, classId:int):MetaDisplayObject {
			return MetaFlasAll.KNIGHT_META.GetMetaDisplayObject(classId);
		}
	
		
		static public function CreateNewSymbol(m:MetaDisplayObject):DisplayObject {
			if(m.isTextField()) {
				var tf:TextField ;
				if(_cachedTextField.length > 0) {
				 	tf = _cachedTextField.pop();
				 } else {
				 	tf = new TextField();
				}
				tf.LoadFromMeta(m);
				return tf;
			} else if(m.isShape()) {
				var s:ShapeObject ;
				
				if(_cachedShapeObject.length > 0) {
				 	s = _cachedShapeObject.pop();
				} else {
				 	s = new ShapeObject();
				}
				s.LoadFromMeta(m);
				return s;
			} 
			
			var metaDisplayObject:MetaDisplayObject = GetMetaDisplayObject(m.metaFlaId, m.theClassId);
			/*if(metaDisplayObject.isButton){
				var btn:ButtonSelect;
				
				if(_cachedButtonSelect.length > 0) {
				 	btn = _cachedButtonSelect.pop();
				} else {
				 	btn = new ButtonSelect();
				}
				
				btn.LoadFromMeta(metaDisplayObject);
				return btn;*/
			/*} else if(metaDisplayObject.isAnimAsset){
				var animAsset:AnimationAsset ;
				
				if(_cachedAnimationAsset.length > 0) {
				 	animAsset = _cachedAnimationAsset.pop();
				} else {
				 	animAsset = new AnimationAsset();
				}
				
				animAsset.LoadFromMeta(metaDisplayObject);
				return animAsset;*/
			//} else {
				var mc:MovieClip ;
				if(_cachedMovieClip.length > 0) {
				 	mc = _cachedMovieClip.pop();
				} else {
				 	mc = new MovieClip();
				}
				
				mc.LoadFromMeta(metaDisplayObject);
				return mc;
			//}
		}
		
		static public function CacheDisplayObject(d:DisplayObject):void {
			
			if(d is TextField) {
				_cachedTextField.push(d as TextField);
			} else if(d is ShapeObject) {
				_cachedShapeObject.push(d as ShapeObject);
			//} else if(d instanceof ButtonSelect) {
				//_cachedButtonSelect.push(d as ButtonSelect);
			//} else if(d instanceof AnimationAsset) {
				//_cachedAnimationAsset.push(d as AnimationAsset);
			} else if(d is MovieClip) {
				_cachedMovieClip.push(d as MovieClip);
			}
			
			MetaCachedGOManager.cache(d.metaGo);
			var dc:DisplayObjectContainer = d as DisplayObjectContainer;
			var child:DisplayObject ;
			
			if(dc != null) {
				while(dc.numChildren > 0) {
					child = dc.firstChild;
					dc.removeChild(child);
					
					CacheDisplayObject(child);
				}
			}
		}

	}
		
}