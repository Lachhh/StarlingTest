package com.chestapp.constants {
	/**
	 * @author LachhhSSD
	 */
	public class GameConstants {
		static public var PLAYER_LVL:Array = constructHeroLVL();	
		
		
		static public var CASH_BONUS_1:Number = 2000;
		static public function constructHeroLVL():Array {
			var xpNeeded:Number = 50;
			var xpTotal:int = 0;
			var result:Array = new Array();
			result.push(0);
			
			for (var i : int = 0; i < (30-1); i++) {
				xpTotal = Math.floor(xpTotal+xpNeeded);
				result.push((xpTotal));
			
				xpNeeded += 50 + i;
				xpNeeded *= 1.01;
			}
			
			return result;
		}
	}
}
