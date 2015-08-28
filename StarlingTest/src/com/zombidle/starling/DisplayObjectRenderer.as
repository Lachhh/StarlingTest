package com.zombidle.starling {
	import starling.display.QuadBatch;
	import starling.core.Starling;
	import starling.filters.ColorMatrixFilter;
	import starling.display.BlendMode;
	import starling.core.RenderSupport;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	import flash.geom.Point;
	import com.berzerkstudio.MetaCachedGOManager;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;

	import com.berzerkstudio.MetaCachedGO;
	import com.berzerkstudio.flash.display.DisplayObject;
	import com.berzerkstudio.flash.display.DisplayObjectContainer;
	import com.berzerkstudio.flash.display.ShapeObject;
	import com.berzerkstudio.flash.display.TextField;
	import com.berzerkstudio.flash.geom.Color;
	import com.berzerkstudio.flash.geom.ColorTransform;
	import com.berzerkstudio.flash.geom.Transform2D;
	import com.berzerkstudio.flash.meta.Matrix4x4;
	import com.berzerkstudio.flash.meta.Vector3;
	import com.berzerkstudio.flash.meta.Vector4;
	
	public class DisplayObjectRenderer {
	
		public var displayObjectContainer:starling.display.DisplayObjectContainer ;
		public var displayObject:com.berzerkstudio.flash.display.DisplayObject ;
		static private var startMatrix2d:Matrix;
		static private var _startMatrix:Matrix4x4;
		static private var _startColor:Color;
		static private var _depth:int = 0;
		
		static private var _tempVecSE:Vector3 = new Vector3(0,0,0);
		static private var _tempVecNW:Vector3 = new Vector3(0,0,0);
		
		static private var _txtField:Vector.<TextField> = new Vector.<TextField>(100);
		static private var _txtFieldIndex:int = -1 ;
		
		static public var matrix2dAnchor:Matrix = new Matrix();
		static public var quadBatch : QuadBatch;
		static public var tintFilter:ColorMatrixFilter;

		public function start() : void {
			_startMatrix = Matrix4x4.createIdentity();
			_startColor = Color.white;
			startMatrix2d = new Matrix();
			startMatrix2d.tx = 0;
			startMatrix2d.ty = 0;
			
			var c3:Vector4 = _startMatrix.GetColumn(3);
			//if(false && SK_VersionInfo.isIPad) {
			//	c3.x = -480 ; 
			//	c3.y = 320 ; 
			//} else {
				//c3.x = -Stage.STAGE_WIDTH*0.5 ; 
				//c3.y = Stage.STAGE_HEIGHT*0.5 ; 
			//}
			c3.x = -480 ; 
			c3.y = 320 ; 
			
			_startMatrix.SetColumn(3, c3);
			//StartCoroutine(DrawCoRoute());
			
			quadBatch = new QuadBatch();
			//quadBatch.batchable = true;
			displayObjectContainer.addChild(quadBatch);
			
			// TODO: Figure out what all this means
			// Tinting the quadbatch!
			// http://forum.starling-framework.org/topic/is-there-a-way-to-minic-colortransform
			// http://doc.starling-framework.org/current/starling/filters/ColorMatrixFilter.html
			/*
			var red:Number = 1;
			var blue:Number = 1;
			var green:Number = 1;
			
			var redOffset:Number = 1;
			var blueOffset:Number = 1;
			var greenOffset:Number = 1;
			var alpha:Number = 1;
			
			// this is building a colortransform... apparently
			var matrix:Vector.<Number> = new <Number>[1 + redOffset/255, 0, 0, 0, 0,
													  0, 1 + greenOffset/255, 0, 0, 0,
													  0, 0, 1 + blueOffset/255, 0, 0,
													  0, 0, 0, 1, 0];
			
			tintFilter = new ColorMatrixFilter(matrix);
			tintFilter = new ColorMatrixFilter();
			tintFilter.tint(0xff0000, 1); // literally says "analagous to flash pro tinting"
			tintFilter.adjustBrightness(0.0); // "tinting with white or black"
			
			quadBatch.filter = tintFilter;
			*/
			
			/*cmTest = new ColorMatrixFilter();
			cmTest.tint(0xFF0000);
			cmTest.adjustSaturation(1);*/
		}
				
		public function Draw():void {
			quadBatch.reset();
			_depth = 0 ; 
			DrawRecur2();
		}
		
		function DrawRecur2():void{
			displayObject.transform.concatenedMatrix = _startMatrix;
			displayObject.transform.concatenedMatrix2D = startMatrix2d;
			
			var count:int = 0;
			var childLeft:int = 1;
			
			var firstDis:com.berzerkstudio.flash.display.DisplayObject = displayObject;
			var crntDis:com.berzerkstudio.flash.display.DisplayObject = firstDis;
			var inBatch:Boolean = false;
			var s:ShapeObject ;
			var dc:com.berzerkstudio.flash.display.DisplayObjectContainer ;
			var child:com.berzerkstudio.flash.display.DisplayObject ;
			var txt:TextField ;
			var mustUpdateConcatened:Boolean = false;
			var childTransform:Transform2D ;
			var crntTransform:Transform2D ;
			
			_txtFieldIndex = -1;
			while(childLeft > 0){
				
				if(crntDis.visible /*&& crntDis.alpha > 0*/){
					if(crntDis.endTextFieldBatch) {
						DrawTextFieldBatch();
						inBatch = false;
					}
					
					if(crntDis.startTextFieldBatch) {
						inBatch = true;
						
						if(firstDis != null) {
							firstDis.endTextFieldBatch = true;
						}
					}
					
					
					if(crntDis.hasMouseEvent) {
						if(crntDis.mouseEnabled) {
							//AddMouseCollider(crntDis, crntDis.transform.concatenedMatrix);
						}
					}
					 
					if(crntDis.isShape) {
						s = (crntDis as ShapeObject);
						//matrix2dAnchor.identity();
						matrix2dAnchor.a = 1;
						matrix2dAnchor.b = 0;
						matrix2dAnchor.c = 0;
						matrix2dAnchor.d = 1;
						matrix2dAnchor.tx = s.anchorX;
						matrix2dAnchor.ty = s.anchorY;
						//matrix2dAnchor.translate(s.anchorX, s.anchorY);
						matrix2dAnchor.concat(s.transform.concatenedMatrix2D);
						DrawShape(s, matrix2dAnchor, s.transform.colorTransform);
					} else if(crntDis.isTextfield) {
						txt = (crntDis as TextField);
						
						if(inBatch) {
							_txtFieldIndex++;
							_txtField[_txtFieldIndex] = txt;
							
						} else {
							//DrawTextField(txt, txt.transform.concatenedMatrix, txt.transform.colorTransform);
						}
						
						txt.onEnterFrame();
						
					} else {
						//add childs to stack
						crntDis.onEnterFrame();
						dc = (crntDis as com.berzerkstudio.flash.display.DisplayObjectContainer);
						
						count = dc.numChildren;
						
						crntTransform = crntDis.transform;
						mustUpdateConcatened = crntTransform.mustUpdateConcatened;
						
						child = dc.lastChild;
						
						while(count > 0){
							
							//Unshift
							childLeft++;
							child.tempNext = firstDis ;
							firstDis = child;
							
							childTransform = child.transform;
							
							if(mustUpdateConcatened || childTransform.mustUpdateConcatened) {
								if(childTransform._isDirty) {
									childTransform.CalcMatrix();
								}
								
								childTransform.concatenedMatrix2D.copyFrom(childTransform.matrix2D);
								childTransform.concatenedMatrix2D.concat(crntTransform.concatenedMatrix2D);
								//childTransform.concatenedMatrix2D.concat(childTransform.matrix2D);
								//childTransform.concatenedMatrix2D *= childTransform.matrix2D;
								
								childTransform.concatenedMatrix = crntTransform.concatenedMatrix.multiply(childTransform._matrix);
								childTransform.concatenedRot = crntTransform.concatenedRot + childTransform.rotation;
								childTransform.mustUpdateConcatened = true;
								
							}
							childTransform.colorTransform.Concat(crntTransform.colorTransform);
							count--;
							
							child = child.prevSibling;
							
						}
						crntTransform.mustUpdateConcatened = false;
						
					}
					
				}
				
				crntDis = firstDis;
				firstDis = crntDis.tempNext ;
				crntDis.tempNext = null;
				childLeft--;
			}
			DrawTextFieldBatch();
		}
		
		function DrawTextFieldBatch():void {
			var txtField:TextField ;
			var fontName:String ;
			var fontSet:Boolean ;
			var i:int = 0 ; 
			var cpt:int = _txtFieldIndex ; 
			
			
			while(cpt >= 0) {
				fontSet = false ;
				for(i = 0 ; i <= _txtFieldIndex ;i++) {
					txtField = _txtField[i];
					
					if(txtField != null) {
						if(!fontSet) {
							fontName = txtField.fontNameUsed;
							fontSet = true;
						}
						
						if(txtField.fontNameUsed == fontName) {
							//DrawTextField(txtField, txtField.transform.concatenedMatrix, txtField.transform.colorTransform);
							_txtField[i] = null;
							cpt--;
						}
					}
				}
			}
			_txtFieldIndex = -1;
		}
		
		
		
		private function DrawShape(s:ShapeObject, matrix:Matrix, color:ColorTransform):void {		
			_depth++;
			
			//var absDepth:int = Math.abs(_depth);
			
			var metaCachedGo:MetaCachedGO = MetaCachedGOManager.getMetaCachedGO(s);//;PrefabManager.getInstance().GetPrefabByShapeObject(s);
			var ps:starling.display.Image = metaCachedGo.getImage();
			//var concatColor:Color = color.concatColor;
			
			ps.transformationMatrix = matrix;
			
			//var tint:uint = ((1.0 << 16) | (color.greenMultiplier << 8) | (color.blueMultiplier));
			//tintFilter.tint(tint, color.alphaColor.a);
			
			//ps.filter = tintFilter;
			
			//if(color.alphaColor.a < 1 && color.alphaColor.a > 0) {
			//ps.alpha = color.alphaColor.a;
			//} else {
				//ps.alpha = color.alphaColor.a;
			//}
			
			//Starling.current.getProgram(name)
			
			//if(ps.parent == null) {
				//displayObjectContainer.addChild(ps);
			/*if(_depth <= 50) {
				displayObjectContainer.addChild(ps)
				ps.filter = cmTest;
			} else {*/
				quadBatch.addImage(ps, ps.alpha);
				//if(_depth <= 50) {
					//quadBatch.blendMode = BlendMode.SCREEN;
					
					/*quadBatch.setVertexColor(_depth-1, 0, 0xff0000);
					quadBatch.setVertexColor(_depth-1, 1, 0xff0000);
					quadBatch.setVertexColor(_depth-1, 2, 0xff0000);
					quadBatch.setVertexColor(_depth-1, 3, 0xff0000);*/
				//}
			//}
			//}
		}
	}
}