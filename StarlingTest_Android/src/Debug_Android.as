package {
	import com.lachhh.lachhhengine.VersionInfo;
	import com.flashinit.DebugInit;

	/**
	 * @author LachhhSSD
	 */
	public class Debug_Android extends DebugInit {
		public function Debug_Android() {
			VersionInfo.isIOS = true;
			super();
		}
	}
}
