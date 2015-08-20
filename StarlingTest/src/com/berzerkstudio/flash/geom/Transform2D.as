package com.berzerkstudio.flash.geom {
	import com.berzerkstudio.flash.meta.Matrix4x4;
	import com.berzerkstudio.flash.meta.Meta2DTransform;
	import com.lachhh.flash.FlashUtils;

	import flash.geom.Matrix;
	public class Transform2D {
		public var colorTransform:ColorTransform = new ColorTransform(); 
	
		public var _matrix:Matrix4x4 = Matrix4x4.createIdentity();
		public var concatenedMatrix:Matrix4x4 = Matrix4x4.createIdentity()  ;
		
		public var matrix2D:Matrix = new Matrix();
		public var concatenedMatrix2D:Matrix = new Matrix() ;
		
		public var concatenedRot:Number = 0;
		
		public var _rotation:Number = 0;
		public var _scaleX:Number = 1;
		public var _scaleY:Number = 1;
		public var _x:Number = 0;
		public var _y:Number = 0;
		public var isUniform:Boolean = true;
		public var _isDirty:Boolean = false;
		public var _isConcatenedDirty:Boolean = true;
		
		public var mustUpdateConcatened:Boolean = true; //Renderer handle this
		
			
		public function LoadFromTransform(metaTransform:Meta2DTransform):void {
			_isDirty = false;
			_isConcatenedDirty = true;
			matrix2D.a = metaTransform.matrix.a;
			matrix2D.b = metaTransform.matrix.b;
			matrix2D.c = metaTransform.matrix.c;
			matrix2D.d = metaTransform.matrix.d;
			matrix2D.tx = metaTransform.matrix.tx;
			matrix2D.ty = metaTransform.matrix.ty;
			
			concatenedMatrix2D.a = 1;
			concatenedMatrix2D.b = 0;
			concatenedMatrix2D.c = 0;
			concatenedMatrix2D.d = 1;
			concatenedMatrix2D.tx = 0;
			concatenedMatrix2D.ty = 0;
			
			concatenedRot = 0 ; 
			concatenedMatrix.m00 = 1;
			concatenedMatrix.m10 = 0;
			concatenedMatrix.m01 = 0;
			concatenedMatrix.m11 = 1;
			concatenedMatrix.m03 = 0; //tx
			concatenedMatrix.m13 = 0; //ty
				
			if(metaTransform.isUniform) {
				_rotation = metaTransform.rotation;
				_scaleX = metaTransform.scaleX;
				_scaleY = metaTransform.scaleY;
				_x = metaTransform.matrix.tx;
				_y = metaTransform.matrix.ty;
				isUniform = true;
				_matrix = metaTransform.GetMatrix();
			} else {
				LoadFromMatrix(metaTransform.GetMatrix());
			}
			
			//_matrix = metaTransform.GetMatrix();
			
			colorTransform.LoadFromColorTransform(metaTransform.colorTransform);
			mustUpdateConcatened = true;
		}
		
		public function LoadFromMatrix(m:Matrix4x4):void {
			var a:Number = m.m00 ;
			var b:Number = m.m01 ;
			var c:Number = m.m10 ;
			var d:Number = m.m11 ;
			_x = m.m03 ;
			_y = m.m13 ;
	
			//[ a, -c, 0, x]
			//[-b,  d, 0, y]
			//
			//
			
			_matrix.m00 = a;
			_matrix.m01 = b;
			_matrix.m10 = c;
			_matrix.m11 = d;
			_matrix.m03 = _x; //tx
			_matrix.m13 = _y; //ty
				
			//_matrix.SetRow(0, row0);
			//_matrix.SetRow(1, row1);//Coute cher
			
			_rotation = Math.asin(c);
			if(-b == c && !FlashUtils.myIsNan(_rotation)) {
				isUniform = true;
				var cos:Number = Math.cos(_rotation);
				_scaleX = a/cos;
				_scaleY = d/cos;
			} else {
				isUniform = false;
				_rotation = 0;  
				_matrix.m01 = -c;
				_matrix.m10 = -b;
			}
			_isDirty = false;
			//mustUpdateConcatened = true;
			//_updateChildConcat = false;
		}
		
		public function Dispose():void {
			isUniform = true;
			_isConcatenedDirty = true;
			_matrix.m00 = 1; //a
			_matrix.m10 = 0; //c
			_matrix.m01 = 0; //b
			_matrix.m11 = 1; //d
			_matrix.m03 = 0; //tx
			_matrix.m13 = 0; //ty
			
			concatenedMatrix.m00 = 1;
			concatenedMatrix.m10 = 0;
			concatenedMatrix.m01 = 0;
			concatenedMatrix.m11 = 1;
			concatenedMatrix.m03 = 0; //tx
			concatenedMatrix.m13 = 0; //ty
			
			matrix2D.a = 1; //a
			matrix2D.b = 0; //c
			matrix2D.c = 0; //b
			matrix2D.d = 1; //d
			matrix2D.tx = 0; //tx
			matrix2D.ty = 0; //ty
			
			concatenedMatrix2D.a = 1;
			concatenedMatrix2D.b = 0;
			concatenedMatrix2D.c = 0;
			concatenedMatrix2D.d = 1;
			concatenedMatrix2D.tx = 0; //tx
			concatenedMatrix2D.ty = 0; //ty
			
			mustUpdateConcatened = true;
			_rotation = 0 ; 
			_scaleX = 1;
			_scaleY = 1;
			_x = 0 ;
			_y = 0 ; 
		}
		
		public function CalcMatrix():void {
			if(isUniform) {
				//var sin:Number = Mathf.Sin(_rotation);
				var cos:Number = Math.cos(_rotation);
				_matrix.m00 =_scaleX*cos; //a
				_matrix.m10 = Math.sin(_rotation); //c
				_matrix.m01 = -_matrix.m10; //b
				_matrix.m11 = _scaleY*cos; //d
				_matrix.m03 = _x; //tx
				_matrix.m13 = _y; //ty
				
				matrix2D.a =_scaleX*cos; //a
				matrix2D.c = Math.sin(_rotation); //c
				matrix2D.b = -_matrix.m10; //b
				matrix2D.d = _scaleY*cos; //d
				matrix2D.tx = _x; //tx
				matrix2D.ty = _y; //ty
				
			} else {			
				_matrix.m03 = _x; //tx
				_matrix.m13 = _y; //ty
				
				matrix2D.tx = _x; //tx
				matrix2D.ty = _y; //ty
			}
			
			_isDirty = false;
		}
		
		public function GetMatrix():Matrix4x4 {
			if(!_isDirty) return _matrix;
			CalcMatrix();
			//mustUpdateConcatened = true;
			return _matrix;
		}
		
		/*public function toString():String {
			return isUniform + "/" + _matrix.ToString();
		}*/
		
		public function set x(value:Number){
			if(_x != value) {
				_x = value; 
				_isDirty = true;
				mustUpdateConcatened = true;
			}
		}
		public function get x():Number{return _x ;}
		
		public function set y(value:Number){
			if(_y != value) {
				_y = value; 
				_isDirty = true;
				mustUpdateConcatened = true;
			}
		}
		public function get y():Number{return _y ;}
		
		public function set scaleX(value:Number){
			if(_scaleX != value) {
				_scaleX = value; 
				_isDirty = true;
				mustUpdateConcatened = true;
			}
		}
		public function get scaleX():Number{return _scaleX ;}
		
		public function set scaleY(value:Number){
			if(_scaleY != value) {
				_scaleY = value; 
				_isDirty = true;
				mustUpdateConcatened = true;
			}
		}
		public function get scaleY():Number{return _scaleY ;}
		
		public function set rotation(value:Number){
			var newValue:Number = ((-value)/180)*Math.PI;
			if(_rotation != newValue) {
				_rotation = newValue; 
				_isDirty = true;
				mustUpdateConcatened = true;
			}
		}
		public function get rotation():Number{return (-_rotation)/Math.PI*180 ;}
	
	}
}