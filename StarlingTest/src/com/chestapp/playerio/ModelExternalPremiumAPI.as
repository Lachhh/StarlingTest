package com.chestapp.playerio {
	import com.chestapp.meta.ChestAppModelBase;
	import com.lachhh.lachhhengine.meta.ModelBase;

	/**
	 * @author Lachhh
	 */
	public class ModelExternalPremiumAPI extends ChestAppModelBase {
		private var _prefixId:String;
		private var _nameOfSystem:String;
		public function ModelExternalPremiumAPI(id:String, prefixId:String, nameOfSystem:String) {
			super(id);
			_prefixId = prefixId;
			_nameOfSystem = nameOfSystem;
		}
		
		public function get prefixId() : String {
			return _prefixId;
		}

		public function get nameOfSystem() : String {
			return _nameOfSystem;
		}
	}
}
