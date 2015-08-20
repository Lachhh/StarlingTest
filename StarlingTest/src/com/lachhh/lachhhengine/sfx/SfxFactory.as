package com.lachhh.lachhhengine.sfx {
	import flash.media.Sound;
	

	/**
	 * @author LachhhSSD
	 */
	public class SfxFactory {
		static public var allSoundClass:Vector.<Class> = new Vector.<Class>();
		
		static public function pushClassLink(pClass:Class):int {
			allSoundClass.push(pClass);
			return (allSoundClass.length-1);
		}
		
		static public function createSound(iSfx:int):Sound {
			var theClass:Class = allSoundClass[iSfx];
			var result:Sound = new theClass();
			return result; 
		}
	}
}
