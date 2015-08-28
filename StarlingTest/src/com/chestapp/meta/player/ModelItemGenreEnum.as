package com.chestapp.meta.player {
	import com.lachhh.lachhhengine.animation.AnimationFactory;
	/**
	 * @author LachhhSSD
	 */
	public class ModelItemGenreEnum {
		static private var _id:int = 0 ;
		static public var ALL:Array = new Array();
				
		static public var NULL:ModelItemGenre = new ModelItemGenre("", AnimationFactory.EMPTY);
		static public var ANY:ModelItemGenre = create("any", AnimationFactory.EMPTY);
		
		/*	
		static public var SWORD:ModelItemGenre = create("sword",  AnimationFactory.ID_ICON_SWORD);
		static public var SHIELD:ModelItemGenre = create("shield", AnimationFactory.ID_ICON_SHIELD);
		static public var HELMET:ModelItemGenre = create("helmet", AnimationFactory.ID_ICON_HELMET);
		static public var BODY:ModelItemGenre = create("body", AnimationFactory.ID_ICON_BODY);
		static public var ARM:ModelItemGenre = create("arm", AnimationFactory.ID_ICON_ARM);
		
		static public var RING:ModelItemGenre = create("ring", AnimationFactory.ID_ICON_RING);
		 */
		static public var SWORD:ModelItemGenre = create("sword",  AnimationFactory.EMPTY);
		static public var SHIELD:ModelItemGenre = create("shield", AnimationFactory.EMPTY);
		static public var HELMET:ModelItemGenre = create("helmet", AnimationFactory.EMPTY);
		static public var BODY:ModelItemGenre = create("body", AnimationFactory.EMPTY);
		static public var ARM:ModelItemGenre = create("arm", AnimationFactory.EMPTY);
		static public var RING:ModelItemGenre = create("ring", AnimationFactory.EMPTY);
		
		
		static public function create(id:String, iconId:int):ModelItemGenre {
			var m:ModelItemGenre = new ModelItemGenre(id, iconId);
			ALL.push(m);
			return m;
		}
		
		static public function getFromId(id:String):ModelItemGenre {
			for (var i : int = 0; i < ALL.length; i++) {
				var g:ModelItemGenre = ALL[i] as ModelItemGenre;
				if(id == g.id) return g;
			}
			return NULL;
		} 
		
		static public function getNum():int {
			return _id;
		}
	}
}
