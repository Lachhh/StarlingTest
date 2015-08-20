package {
	import com.lachhh.lachhhengine.VersionInfo;
	import com.flashinit.DebugInit;

	/**
	 * @author LachhhSSD
	 */
	public class Debug_iOs extends DebugInit {
		public function Debug_iOs() {
			VersionInfo.isIOS = true;
			super();
		}
	}
}
