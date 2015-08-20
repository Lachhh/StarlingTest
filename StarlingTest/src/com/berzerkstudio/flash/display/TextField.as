package com.berzerkstudio.flash.display {
	import starling.utils.Color;

	import com.berzerkstudio.flash.meta.MetaDisplayObject;
	import com.zombidle.multilingual.TextFactory;
	public class TextField extends DisplayObject {
		public var textColor:uint ; //Deprecated
		public var multiline:Boolean; //Deprecated
		
		public var fontName:String;
		public var fontNameUsed:String;
		private var _text:String;
		public var textId:int;
		
		public var color:Color = new Color();
		
		public var size:Number;
		
		public var maxScrollV:Number;
		public var maxScrollH:Number;
		public var selectable:Boolean;
		public var autoSize:String;
		public var background:Boolean ;
		public var backgroundColor:uint ;
		public var type:String;
		public var isDynamic:Boolean;
		
		public var align:String;
		
		public var xOffset:int = 0;
		public var yOffset:int = 0;
		public var textDirty:Boolean = true;
		
		public var prefabName:String = "";
		public var prefabId:int = -1;
		
		private var _textFormat:TextFormat = new TextFormat();
		public var textColorUsed:Boolean = false;
		
		override public function LoadFromMeta(m:MetaDisplayObject):void {
			super.LoadFromMeta(m);
			//font = Resources.Load("Fonts/" + m.fontName) as Font;
			fontName = m.fontName.toLowerCase();
			
			fontNameUsed = fontName;
				
			textId = m.textId;
			if(textId != -1) {
				//_text = TextFactory.getinstance().GetMsg(textId);
				_text = m.text;
			} else {
				_text = m.text;
			}
			
			color[0] = m.r;
			color[1] = m.g;
			color[2] = m.b;
			color[3] = 1;
			
			size = m.textSize;
			textColorUsed = false;
			textDirty = true;		
			
			isDynamic = false;
			align = m.textAlign;
			
			//textColor = m.textColor;
			
			prefabName = "";
			prefabId = -1;
			
			
			hitArea.width = m.width;
			hitArea.height = m.height;
			textDirty = true;
			
			switch(align) {
				case "l" : 
					xOffset = 0;
					break;
				case "c" : 
					xOffset = width*0.5;
					break;
				case "r" : 
					xOffset = width;
					break;
			}
			
		}
		
		public function LanguageChanged():void {
			/*if(TextFactory.getinstance().language.useSystemFont) {
				fontNameUsed = TextFactory.getinstance().language.fontUsed;
			} else {*/
				fontNameUsed = fontName;
			//}
			
			//if(textId != -1) {
				//_text = TextFactory.getinstance().GetMsg(textId);
			//} 
			
			prefabName = "";
			prefabId = -1;
			textDirty = true;
			if(metaGo != null) {
				metaGo.shapeObject = null;
			}
			metaGo = null;
		}
		
		public function GetText():String {
			/*if(textId != -1) {
				_text = TextFactory.getinstance().GetMsg(textId);
			}*/
			return _text;
		}
		
		public function getTextFormat():TextFormat {
			return _textFormat;
		}
		
		public function setTextFormat(tf:TextFormat):void {
			
		}
		
		public function set text(value:String):void {
			textDirty = textDirty || (_text != value);
			_text = value;
		}
		
		public function get text():String {
			return _text;
		}
		
		//public function set width(value:Number):void{metaDisplayObject.width }
		override public function get width():Number{
			if(metaDisplayObject == null) return 0;
			return metaDisplayObject.width ;
		}
		
		override public function set width(value:Number):void{ 
			if(metaDisplayObject == null) return ;
			metaDisplayObject.width = value; 
		}
		
		//public function set height(value:Number):void{}
		override public function get height():Number{
			if(metaDisplayObject == null) return 0;
			return  metaDisplayObject.height ;
		}
		
		override public function get isTextfield():Boolean{return true ;}
		
	}
}