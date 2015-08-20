package {
	import com.flashinit.DebugInit;
	import com.lachhh.lachhhengine.VersionInfo;

	/**
	 * @author LachhhSSD
	 */
	public class Release_Android extends DebugInit {
		public function Release_Android() {
			VersionInfo.isIOS = true;
			super();
		}
	}
}
