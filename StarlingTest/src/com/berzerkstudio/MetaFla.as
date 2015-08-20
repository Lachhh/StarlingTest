package com.berzerkstudio {
	import com.berzerkstudio.flash.meta.Meta2DTransform;
	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	import com.berzerkstudio.flash.meta.MetaMovieClip;
	import com.berzerkstudio.flash.meta.MetaMovieClipFrame;
	import com.berzerkstudio.flash.meta.Vector4;
	import com.lachhh.flash.FlashUtils;

	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	public class MetaFla  {
		
	//	private var _allSymbolXML:XMLNodeList ;
		
		private var _allSymbol : Vector.<MetaDisplayObject> = new Vector.<MetaDisplayObject>();
		
		private var _id:int = -1 ;
		private var docName:String = "" ;
		private var numToPreload:int = 0 ;
		
		private var _loadedIndex:int = 0;
		private var _indexOffset :int = 0;
		public var _numTextures :int = 0;
		
		public function MetaFla(pId:int) {
			_id = pId;
			
		}
		
		public function Init(xmlString:String):void {
			var _xDoc:XMLDocument = new XMLDocument();
			_xDoc.ignoreWhite = true;
			_xDoc.parseXML(xmlString);
			
			
			var all:XMLNode = _xDoc.childNodes[0];
			trace(all);
			//var allSymbolXML:XMLNode = all.firstChild;
			
			docName = all.attributes["docName"] as String;
			_numTextures = FlashUtils.myParseFloat(all.attributes["numTexture"]);
			_allSymbol = new Vector.<MetaDisplayObject>(all.childNodes.length);
			
			
			for(var i:int =0 ; i < all.childNodes.length ; i++) {
				var childNode:XMLNode = all.childNodes[i];
				_allSymbol[i] = CreateMetaDisplayObject(childNode);
			}
		}
		
		public function GetMetaDisplayObject(classId:int):MetaDisplayObject {		
			return _allSymbol[classId];
		}
		
		public function GetMetaDisplayObjectFromString(name:String):MetaDisplayObject {
			for (var i : int = 0; i < _allSymbol.length; i++) {
				if(_allSymbol[i].theClassName == name) return _allSymbol[i]; 
			}		
			return null;
		}
		
		public function CreateMetaDisplayObject(xmlSymbol:XMLNode):MetaDisplayObject {
			var metaFrames : Vector.<MetaMovieClipFrame> = new Vector.<MetaMovieClipFrame>();
			//var metaFramesArray:Array = new Array();
	
			var className:String  = xmlSymbol.attributes["theClass"];		
			var animClassId:int  = FlashUtils.myParseFloat(xmlSymbol.attributes["theClassId"]) ;	
			var isButton:Boolean = (xmlSymbol.attributes["isButton"] == "1");
			var isAnimAsset:Boolean = (xmlSymbol.attributes["isAnimAsset"] == "1");
			
	
			var xmlFramesList:Array = xmlSymbol.childNodes;
			var xmlFramesLabelsList:Array = null;
			
			var numFrames:int = xmlFramesList.length ;
			var anim:MetaMovieClip = new MetaMovieClip();
			
			anim.theClassId = animClassId;
			anim.theClassName = className;
			anim.name = "instance";
			anim.isButton = isButton;
			anim.isAnimAsset = isAnimAsset;
					
			anim.metaFlaId = _id;
			
			//_allMetaDisplayObject[animClassId] = anim;
			var maxDisplayObjects:int = 0 ; 
			
			
			/*if(xmlFramesLabelsList != null) {
				anim.frameLabels = new Vector.<String>(xmlFramesLabelsList.length);
				anim.frameLabelsId = new Vector.<int>(xmlFramesLabelsList.length);
				for(var jj:int  = 0 ; jj < xmlFramesLabelsList.length ; jj++) {
					var xmlFrameLabel:XML = xmlFramesLabelsList[jj];
					var frame:int =  FlashUtils.myParseFloat(xmlFrameLabel.attributes["i"]);
					var name:String =  xmlFrameLabel.attributes["name"];
					
					anim.frameLabels[jj] = name;
					anim.frameLabelsId[jj] = frame;
				}
			}*/
			
			
			
			var frameToMetaIdArray:Vector.<int> = new Vector.<int>();
			metaFrames = new Vector.<MetaMovieClipFrame>();
			
			for(var k:int = 0 ; k < xmlFramesList.length ; k++) {
				var xmlFrame:XMLNode = xmlFramesList[k];
				if(xmlFrame.nodeName != "Frame") continue;
				
				var xmlDisplayObjectList:Array = xmlFrame.childNodes;
				var numDisplayObjects:int = 0;
				if(xmlDisplayObjectList != null) {
					 numDisplayObjects = xmlDisplayObjectList.length ;
				} else {
					//continue;
				}
				
				var metaFrame:MetaMovieClipFrame ;
				if(numDisplayObjects > maxDisplayObjects) {
					maxDisplayObjects = numDisplayObjects;
				}
				
				metaFrame = new MetaMovieClipFrame();
				metaFrame.metaDisplayObjects = new Vector.<MetaDisplayObject>(numDisplayObjects);
				
				var boundsStr:String = xmlFrame.attributes["bounds"];
				if(boundsStr == null) {
					trace("no bounds " + className);
				} else {
					var aBounds:Array = boundsStr.split(",");
					metaFrame.bounds.x = FlashUtils.myParseFloat(aBounds[0]) ;
					metaFrame.bounds.y = FlashUtils.myParseFloat(aBounds[1]) ;
					metaFrame.bounds.width = FlashUtils.myParseFloat(aBounds[2]) ;
					metaFrame.bounds.height = FlashUtils.myParseFloat(aBounds[3]) ;
				}
				
				for(var l:int = 0 ; l < numDisplayObjects ; l++) {
					var d:MetaDisplayObject ;
					
					var xmlDisplayObject:XMLNode = xmlDisplayObjectList[l];
					var symbolInstanceName:String = xmlDisplayObject.attributes["name"];
					var symbolClassName:String = xmlDisplayObject.attributes["theClass"];
					
					var isTexture:Boolean = (xmlDisplayObject.attributes["isTexture"] == "1");
					
					var transform:String = xmlDisplayObject.attributes["transform"];
					var colorTransform:String = xmlDisplayObject.attributes["colorTransform"];
					
					var aTransform:Array = transform.split(",");
					var alpha:Number = FlashUtils.myParseFloat(xmlDisplayObject.attributes["alpha"]);
					var aColorTransform:Array = colorTransform.split(",");
					
					var row0:Vector4 ;
					var row1:Vector4 ;
											
					d = new MetaDisplayObject();
					
					
					if(symbolClassName == "TextField") {
						
						//var tf:MetaTextField = new MetaTextField();
						var textIdStr:String = xmlDisplayObject.attributes["textId"]; 
						d.text = xmlDisplayObject.attributes["text"];
						if(textIdStr == null || textIdStr == "")  {
							d.textId = -1;
						} else {
							d.textId = FlashUtils.myParseFloat(textIdStr);
						}
						
						d.fontName = xmlDisplayObject.attributes["font"];
						d.width = FlashUtils.myParseFloat(xmlDisplayObject.attributes["w"]);
						d.height = FlashUtils.myParseFloat(xmlDisplayObject.attributes["h"]);
						d.textSize = FlashUtils.myParseFloat(xmlDisplayObject.attributes["size"]);
						d.textAlign = xmlDisplayObject.attributes["align"];
						
						var color:uint = FlashUtils.myParseFloat(xmlDisplayObject.attributes["color"]);
						
						d.r = (((color >> 16) & 0xFF)+0.0)/255;
						d.g = (((color >> 8) & 0xFF)+0.0)/255;
						d.b = (((color >> 0) & 0xFF)+0.0)/255;
						//d.a = (((color >> 0) & 0xFF)+0.0)/255;
						
						
						//d.a = color >> 0;
						
						
						d.theClassId = -1;
					} else if(symbolClassName == "undefined") {
						trace("Undefined class");
						continue;
					} else if(isTexture) {
						var w:int = FlashUtils.myParseFloat(xmlDisplayObject.attributes["w"]);
						var h:int = FlashUtils.myParseFloat(xmlDisplayObject.attributes["h"]);
						var psFrame:int = FlashUtils.myParseFloat(xmlDisplayObject.attributes["frame"]);
	
						//var so:MetaShapeObject = new MetaShapeObject();
						d.theClassId = -1;
						d.prefabId = _id;
						d.prefabName = "FlashPrefabs/" + docName;
						d.packedSpriteframe = psFrame;
						d.textureName = symbolClassName;
						d.width = w;
						d.height = h;
						var anchorX:int = FlashUtils.myParseFloat(xmlDisplayObject.attributes["aX"]);
						var anchorY:int = FlashUtils.myParseFloat(xmlDisplayObject.attributes["aY"]);
						d.anchorX = anchorX;
						d.anchorY = anchorY;
						
						//(-1, _id, docName,  psFrame, w, h);
						//classId:int, pPrefabId:int, name:String, textureName:String, psFrame:int, w:int, h:int) {
						
					} else {
						
						//trace(symbolClassName + "/" + xmlDisplayObject.attributes["theClassId"]) ;
						d.theClassId = FlashUtils.myParseFloat(xmlDisplayObject.attributes["theClassId"]);
						if(d.theClassId == -1) {
							trace("WARNING unknown displayObject ignored : " + symbolClassName + "/" + docName + "/" + className);
							continue;
						}
					}
					
					
					d.theClassName = symbolClassName;
					d.name = symbolInstanceName;
					d.metaFlaId = _id;
					
					row0 = new Vector4();
					row1 = new Vector4();
					row0.x = FlashUtils.myParseFloat(aTransform[0]) ;
					row0.y = FlashUtils.myParseFloat(aTransform[1]) ;
					row1.x = FlashUtils.myParseFloat(aTransform[2]) ;
					row1.y = FlashUtils.myParseFloat(aTransform[3]) ;
					row0.w = FlashUtils.myParseFloat(aTransform[4]) ;
					row1.w = FlashUtils.myParseFloat(aTransform[5]) ;
					
					d.transform = new Meta2DTransform();
					d.transform.LoadFromFromRows(row0, row1);
					var colorUint:uint = FlashUtils.myParseFloat(colorTransform);
					
					d.transform.colorTransform.r = FlashUtils.myParseFloat(aColorTransform[0])/255;
					d.transform.colorTransform.g = FlashUtils.myParseFloat(aColorTransform[1])/255;
					d.transform.colorTransform.b = FlashUtils.myParseFloat(aColorTransform[2])/255;
					d.transform.colorTransform.a = FlashUtils.myParseFloat(aColorTransform[3]);
					d.transform.colorTransform.alpha = alpha;
					/*d.transform.colorTransform.redOffset = FlashUtils.myParseFloat(aColorTransform[0]) ;
					d.transform.colorTransform.redMultiplier = FlashUtils.myParseFloat(aColorTransform[1]) ;
					d.transform.colorTransform.greenOffset = FlashUtils.myParseFloat(aColorTransform[2]) ;
					d.transform.colorTransform.greenMultiplier = FlashUtils.myParseFloat(aColorTransform[3]) ;
					d.transform.colorTransform.blueOffset = FlashUtils.myParseFloat(aColorTransform[4]) ;
					d.transform.colorTransform.blueMultiplier = FlashUtils.myParseFloat(aColorTransform[5]) ;
					d.transform.colorTransform.alphaOffset = FlashUtils.myParseFloat(aColorTransform[6]) ;
					d.transform.colorTransform.alphaMultiplier = FlashUtils.myParseFloat(aColorTransform[7]) ;
					*/
					metaFrame.metaDisplayObjects[l] = d;
				}	
				
				var iFrameStr:String = xmlFrame.attributes["i"];
				var numIdem:int = iFrameStr.split(",").length;
				
				for(var kk:int = 0 ; kk < numIdem ; kk++) {
					frameToMetaIdArray.push(k);
					metaFrames.push(metaFrame);
				}
			}
			
			anim.maxDisplayObjects = maxDisplayObjects;
			anim.metaMovieClipFrames = metaFrames ;	
			
			anim.stopOnEnter = new Vector.<Boolean>(frameToMetaIdArray.length);
			anim.frameToMetaId = new Vector.<int>(frameToMetaIdArray.length);
			var ii:int = 0 ; 
			for(ii = 0 ; ii < anim.stopOnEnter.length ; ii++) {
				anim.stopOnEnter[ii] = false;
				anim.frameToMetaId[ii] = frameToMetaIdArray[ii];
			}
			
			if(isButton) {
				if(anim.GetFrame("out")-2 >= anim.stopOnEnter.length) {
					trace("CACA" + className + "/" + (anim.GetFrame("out")-2) + "/" + anim.stopOnEnter.length);
				}
				anim.stopOnEnter[anim.GetFrame("down")-2] = true;
				anim.stopOnEnter[anim.GetFrame("over")-2] = true;
				anim.stopOnEnter[anim.GetFrame("out")-2] = true;
				if(anim.HasFrameLabel("selected")) {
					anim.stopOnEnter[anim.GetFrame("selected")-3] = true;
				}
				anim.stopOnEnter[ii-1] = true;
			}
						
			return anim ;
		}
		
		public function get id():int {
			return _id;
		}
		
		public function get allLoaded():Boolean {
			if(_allSymbol == null) return false;
			return _loadedIndex >= _allSymbol.length;
		}
		
		public function get numTextures():int {
			return _numTextures;
		}
		
		public function get indexOffset():int {
			return _indexOffset;
		}
		
		public function set indexOffset(value:int) {
			_indexOffset = value;
		}
		
	}
}