package com.infernax.constants {

	/**
	 * @author Lachhh
	 */
	public class GameConstants {
		static private var _instance : GameConstants = new GameConstants();

		public function GameConstants() {
			super();
		}
		
		static public function get instance() : GameConstants {
			return _instance;
		}
	}
}
