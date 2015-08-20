package com.zombidle.starling {
	public class PrefabManager extends SymbolManager {
		static private var _instance:PrefabManager ;
		static private var NUM_CACHED_MIN:int = 20;
		
		public var loadOnInit:boolean = false;
		public var litePackedSprite:GameObject ;
		public var isx1024:boolean = false;
		
		private var _prefabById:GameObject[];
		private var _masterPackedSprite:GameObject[];
		private var _packedSprite:PackedSprite[];
		
		private var _cachedPrefabsById:MetaCachedGO[];
		
		
		private var _firstActive:MetaCachedGO = null;
		private var _numActive:int = 0;
		
		
		//faire un robot pour l'exportation des fonts
		//public var fontsTextAsset:TextAsset[];
		//public var fontsTexture:Texture[];
		//public var assetHashtable:Hashtable;
		//public var textureHashtable:Hashtable;
		//public var textMaterials:Material[];
		
		private var _stageRenderer:DisplayObjectRenderer ;
		
		
		private var _clearCache:boolean = false;
		
		private var _allPrerendered:boolean = false;
		private var _preloadSoundsIndex:int = -1;
	
		/*RENDU ICITTE*/
		
		private var _textprefab_joystix:int;
		private var _textprefab_arial:int;
	
		private var _numPreloads:int = 0;
		private var _totalToPreload:int = 1;
		
		private var _numLite:int = 0;
		private var _numLiteToPreload:int = 3;
		
		private var _gameStarted:boolean = false;
		
			
		override protected function Init():void {	
			super.Init();
			/*if(SK_VersionInfo.isIPad) {
				stage.stageWidth = 960;
				stage.stageHeight = 720;
			} else {
			
				if(SK_VersionInfo.hasRetinaDisplay){
					stage.stageWidth = 960;
					stage.stageHeight = 640;
				} else {
					stage.stageWidth = 480;
					stage.stageHeight = 320;
				}
			}*/
			if(VersionInfo.resolutionResizeTexture == 0.5f) {
				//SK_VersionInfo.lowQuality = true;
			}
			
			stage.stageWidth = VersionInfo.resolutionWidth;
			stage.stageHeight = VersionInfo.resolutionHeight;
					
			Stage.STAGE_WIDTH = stage.stageWidth;
			Stage.STAGE_HEIGHT = stage.stageHeight;
			
			_instance = this;
			
			_prefabById = new GameObject[numPrefabs+5];
			_cachedPrefabsById = new MetaCachedGO[numPrefabs+5];
			
			_masterPackedSprite = new GameObject[numPrefabs];
			_packedSprite = new PackedSprite[numPrefabs];
			
			
			for (var j:int = 0 ; j < _masterPackedSprite.length ; j++) {
				_masterPackedSprite[j] = null;
			}
			
			_textprefab_joystix = numPrefabs;
			_textprefab_arial  = numPrefabs+1;
			
			
			
			_stageRenderer = (gameObject.AddComponent(DisplayObjectRenderer) as DisplayObjectRenderer);
			_stageRenderer.displayObject = stage;
			
			
			_allPrerendered = false;
			_preloadSoundsIndex = -1;
	
			_totalToPreload = 10 ; //num of TextField
			_totalToPreload += _numLiteToPreload ;
			//_totalToPreload += 40 ; //num sounds
			for(var i:int = 0; i < metaFlas.length; i++){
				_totalToPreload += metaFlas[i].numToPreload ;
			}
			
			
		}
		
		
		function OnApplicationQuit () : void {
			if(_gameStarted) {
				//FileManager.getinstance().SaveToExternalAPI();
				//AchievementManager.getinstance().RebestowAllExternalAchievement();
			}
		}
		
		function OnApplicationPause (pause:boolean) : void {
			if(_gameStarted) {
				//FileManager.getinstance().SaveToExternalAPI();
				//AchievementManager.getinstance().RebestowAllExternalAchievement();
			}
		}
		
		public function Update():void {
			
			if(loadOnInit) {
				if(GetPrctPreloadComplete() < 1) {
					PreloadFrame();	
				} 
				
				if(isInit && mainCreated) {
					StartGame();
					loadOnInit = false;
				}
			} else {
				UpdateFrame();
			}
		
		}
		
		override public function StartGame():void {
			super.StartGame();
			//ScreenManager.getinstance().ShowScreen(HB_ScreenFactory.ID_TITLE_SCREEN);
			_gameStarted = true;
		}
		
		public function GetMetaFlaByName(name:String):MetaFla {
			for(var i :int = 0 ; i < metaFlas.length ; i++) {
				var metaFla:MetaFla = metaFlas[i];
				if(metaFla.docName == name) return metaFla;
			}
			return null;
		}
		
		public function GetFontTextAsset(str:String):TextAsset{
			return null;	
		}
		
		public function GetFontAsset(str:String):TextAsset{
			return null;
		}
		
		override protected function UpdateFrame():void {
			super.UpdateFrame();
			CacheAll();
			_stageRenderer.Draw();
			if(_clearCache) {
				_clearCache = false;
				ClearCacheNow();
			}
		}
		
		override public function PreloadFrame():void {
			super.PreloadFrame();
			if(mainCreated && isInit) {
				for(var i:int = 0 ; i < 10 ; i++) { // 10 insatnce per frame to make the loading faster
					if(!_allPrerendered){
						CheckPreRender();
					}
				}
			}
		}
		
		override public function GetPrctPreloadComplete():float {
			var prct:float = super.GetPrctPreloadComplete();
			if(!(mainCreated && isInit)) return prct;
			return prct +((_numPreloads+0.0)/_totalToPreload)*0.5;
		}
			
		private function CheckPreRender():void {
			var m:MetaCachedGO ;
			var metaFla:MetaFla ;
			for(var i :int = 0 ; i < _cachedPrefabsById.length ; i++) {
				var numCreated:int = GetNumPrefabsCachedById(i) + GetNumPrefabsActiveById(i);
			
				
				if(i == _textprefab_joystix && (numCreated < 10)) {
					m = InstantiatePrefab(i, GetFontPrefabFromFontName("joystix"), false);
					CacheGO(m);
					_numPreloads++;
					return ;
				} else if(i == _textprefab_arial && (numCreated < 0)) {
					m = InstantiatePrefab(i, GetFontPrefabFromFontName("arial"), false);
					CacheGO(m);
					_numPreloads++;
					return ;
				} else if(i < metaFlas.length) {
					metaFla = metaFlas[i];
					
					if((_masterPackedSprite[i] == null) || (i == (metaFlas.length-1) && _numLite < _numLiteToPreload)) {
						//if(isx1024) {
							//m = InstantiatePrefab(i, "FlashPrefabs/" + metaFla.docName + "x1024", true);
						//} else {
							m = InstantiatePrefab(i, "FlashPrefabs/" + metaFla.docName , true);
						//}
						CacheGO(m);
						_numPreloads++;
						return ;
					}
				}
				
			}
			
			if(_preloadSoundsIndex == -1) {
				//_preloadSoundsIndex = HB_SfxFactory.ID_SFX_SWORD_SWING2;
				
				return ;
			}
			/*
			if(_preloadSoundsIndex <= HB_SfxFactory.ID_SFX_LVL_PROGRESS) {
				Jukebox.getinstance().PreloadSoundFromId(_preloadSoundsIndex);
				_preloadSoundsIndex++;
				_numPreloads++;
				return ;
			}*/
			_allPrerendered = true;
		}
		
		private function GetNumPrefabsCachedById(prefabId:int):int {
			var m:MetaCachedGO = _cachedPrefabsById[prefabId];
			var cpt:int = 0 ; 
			while(m != null) {
				cpt++;
				m = m.nextCachedGO;
			}
			return cpt;
		}
		
		private function GetNumPrefabsActiveById(prefabId:int):int {
			var m:MetaCachedGO = _firstActive;
			var cpt:int = 0 ; 
			while(m != null) {
				if((m.isLite && (prefabId >= numPrefabs)) || (m.id == prefabId)) cpt++;
				m = m.nextActiveGO;
			}
			return cpt;
		}
		
		private function CacheAll():void {
			ColliderListener.CacheAll();
			var m:MetaCachedGO = _firstActive;
			var mPrev:MetaCachedGO = null;
			var mNext:MetaCachedGO ;
			
			while(m != null) {
				mNext = m.nextActiveGO;
				
				if(m.notUsed) {
					CacheGO(m);
					if(m == _firstActive) _firstActive = mNext;
					if(mPrev != null) mPrev.nextActiveGO = mNext;
					
					m.nextActiveGO = null;
					_numActive-- ; 
				} else {
					m.notUsed = true;
					m.renderer.enabled = false;
					mPrev = m;
					
				}
				
				m = mNext;
			}
		}
		
		private function CacheGO(m:MetaCachedGO):void {
			m.nextCachedGO = _cachedPrefabsById[m.cacheId];
			_cachedPrefabsById[m.cacheId] = m;
			m.onCache();
		}
		
		public function ClearCache():void {
			_clearCache = true;
		}
		
		private function ClearCacheNow():void {
			
			for(var i:int = 0 ; i < _cachedPrefabsById.length ; i++) {
				var crntCached:MetaCachedGO = _cachedPrefabsById[i];
				var prev:MetaCachedGO ;
				_cachedPrefabsById[i] = null;
				while(crntCached != null) { 
					prev = crntCached;
					crntCached = crntCached.nextCachedGO ;
					prev.Dispose();
					Destroy(prev.go);
				}
			}
		}
		
		private function InstantiatePrefab(prefabId:int, loadName:String, isLite:boolean):MetaCachedGO {
			var prefab:GameObject = _prefabById[prefabId];
				
			if(prefab == null) {
				_prefabById[prefabId] = (Resources.Load(loadName) as GameObject);
				prefab = _prefabById[prefabId] ;
			} 
			var go:GameObject ;
			var metaCachedGo:MetaCachedGO = new MetaCachedGO();
			if(!isLite) {
			 	go = (Instantiate(prefab) as GameObject);
			 	if(VersionInfo.resolutionResizeTexture == 0.5f) {
			 		go.layer = 1;
			 	}
			 	metaCachedGo.id = prefabId;
			 	metaCachedGo.cacheId = prefabId;
			 	metaCachedGo.packedSprite = go.GetComponent(SpriteText) as SpriteText;
			 } else {
			 	if(_masterPackedSprite[prefabId] == null) {
			 		_masterPackedSprite[prefabId] = (Instantiate(prefab) as GameObject);
			 		_masterPackedSprite[prefabId].active = false;
			 		_packedSprite[prefabId] = _masterPackedSprite[prefabId].GetComponent(PackedSprite) as PackedSprite ;
			 	}
			 	var masterPs:GameObject = _masterPackedSprite[prefabId];
			 	var ps:PackedSprite = _packedSprite[prefabId];
			 	var lite:LitePackedSprite ;
			 	go = (Instantiate(litePackedSprite) as GameObject);
			 	go.renderer.sharedMaterial = masterPs.renderer.sharedMaterial;
			 	
			 	
			 	lite = go.GetComponent(LitePackedSprite) as LitePackedSprite;
			 	lite.packedSprite = ps;
			 	metaCachedGo.id = prefabId;
			 	metaCachedGo.cacheId = 0;
			 	metaCachedGo.packedSprite = lite;
			 	_numLite++;
			 }
			 
			//DontDestroyOnLoad(go);	
			
			metaCachedGo.go = go;
			
			metaCachedGo.meshF = (go.GetComponent(MeshFilter) as MeshFilter);
			metaCachedGo.textMesh = (go.GetComponent(TextMesh) as TextMesh);
			metaCachedGo.isLite = isLite;
			
			if(metaCachedGo.meshF != null) {
				metaCachedGo.mesh = metaCachedGo.meshF.sharedMesh;
				metaCachedGo.meshVertices = metaCachedGo.mesh.vertices;
			}
			metaCachedGo.transform = go.transform;
			metaCachedGo.renderer = go.renderer;
			if(metaCachedGo.renderer != null) metaCachedGo.material = metaCachedGo.renderer.sharedMaterial ;
			
			metaCachedGo.transform.position = new Vector3(240, -160, 0);
			metaCachedGo.firstDraw = true;
			return metaCachedGo;
		}
		
		
		public function GetPrefabById(prefabId:int, loadName:String, s:DisplayObject, packedSpriteFrame:int, isLite:boolean, isShape:boolean):MetaCachedGO {
			if(s.metaGo != null) {
				s.metaGo.notUsed = false;
				s.metaGo.renderer.enabled = true;
				return s.metaGo;
			}
			
			var firstCachedGo:MetaCachedGO; 
			var go:GameObject; 
			var cacheId:int ;
			if(isLite) {
				cacheId = 0 ; 
			} else {
				cacheId = prefabId ; 
			}
			
			firstCachedGo = _cachedPrefabsById[cacheId];
			var metaCachedGo:MetaCachedGO ;
			
			if(firstCachedGo == null) {
				metaCachedGo = InstantiatePrefab(prefabId, loadName, isLite);
			} else {
				
				_cachedPrefabsById[cacheId] = firstCachedGo.nextCachedGO;
				metaCachedGo = firstCachedGo;
				metaCachedGo.nextCachedGO = null;	
				metaCachedGo.onUncache();
			}
			
			metaCachedGo.nextActiveGO = _firstActive;
			_firstActive = metaCachedGo;
			
			
			if(isShape) { // If SHape
				var ps:LitePackedSprite = (metaCachedGo.packedSprite as LitePackedSprite);
				
				/*if(ps == null) {
					ps = (metaCachedGo.go.GetComponent(LitePackedSprite) as LitePackedSprite);
				}*/
				
				//if(ps != null) {
					ps.packedSprite = _packedSprite[prefabId];
					ps.GotoFrame(packedSpriteFrame);
					//metaCachedGo.packedSprite = ps;
				//}
			} else { //If TExtField
				/*var st:SpriteText = metaCachedGo.packedSprite as SpriteText ;
				if(st == null) {
					st = (metaCachedGo.go.GetComponent(SpriteText) as SpriteText);
					metaCachedGo.packedSprite = st;
				}*/
				
				//if(st != null) {
					//metaCachedGo.packedSprite = st;
				//}
			}
			
			
			_numActive++;
			metaCachedGo.notUsed = false;
			metaCachedGo.displayObject = s;
			metaCachedGo.firstDrawPerCache = true;
			s.metaGo = metaCachedGo;
			return metaCachedGo;
		}
		
		/*public function GetPrefabByTextField(s:TextField):MetaCachedGO {
			return GetPrefabById(_textPrefabId, "TextPrefab", s);
		}*/
		
		public function GetPrefabByTextField(s:TextField):MetaCachedGO{
			if(s.prefabId == -1)  {
				s.prefabName = PrefabManager.getInstance().GetFontPrefabFromFontName(s.fontNameUsed);
				s.prefabId = PrefabManager.getInstance().GetPrefabIdFromFontName(s.fontNameUsed);
			}
			return GetPrefabById(s.prefabId, s.prefabName, s, -1, false, false);
		}
		
		
		public function GetPrefabIdFromFontName(fontName:String):int{
			//if(TextFactory.getinstance.language.locale == "JA") return _textprefab_arial;
			if(fontName == "joystix"){
				return _textprefab_joystix;
			}  
			if(fontName == "arial"){
				return _textprefab_arial;
			}
			Debug.LogError("impossible de trouver le id du font     " + fontName);
		}
		
		
		public function GetFontPrefabFromFontName(fontName:String):String{
			//if(TextFactory.getinstance.language.locale == "JA") return "TextPrefab_Arial";
			if(fontName == "joystix"){
				return "TextPrefab_Joystix";
			}
			if(fontName == "arial"){
				return "TextPrefab_Arial";
			}
			Debug.LogError("impossible de trouver le nom du prefab   " + fontName);
		}
		
		public function GetPrefabByShapeObject(s:ShapeObject):MetaCachedGO {
			return GetPrefabById(s.prefabId, s.prefabName, s, s.packedSpriteframe, true, true);
		}	
			
		public function get numPrefabs():int {
			return metaFlas.length;
		}
		
		override protected function CreateMain():MainGame {
			//return null;
			return new IX_Main();
		}	
		
		static public function getInstance():PrefabManager {
			return _instance;
		}
		
		
	}

}