package {
	import com.lachhh.lachhhengine.VersionInfo;
	import com.flashinit.DebugInit;

	/**
	 * @author LachhhSSD
	 */
	public class Release_iOs extends DebugInit {
		public function Release_iOs() {
			VersionInfo.isIOS = true;
			super();
		}
	}
}
