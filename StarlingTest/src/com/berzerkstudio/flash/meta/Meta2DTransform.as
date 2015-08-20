//@script Serializable
package com.berzerkstudio.flash.meta {
	import com.lachhh.flash.FlashUtils;
	public class Meta2DTransform {
		public var matrix:Meta2DMatrix ;
		public var colorTransform:MetaColorTransform ;
		
		private var _rotation:Number = 0;
		private var _scaleX:Number = 1;
		private var _scaleY:Number = 1;
		private var _x:Number = 0;
		private var _y:Number = 0;
		
		
		private var _isUniform:Boolean = false;
		
		private var _isDirty:Boolean = true;
		private var _matrix3D:Matrix4x4 = Matrix4x4.createIdentity();
		
		public function Meta2DTransform() {
			matrix = new Meta2DMatrix();
			colorTransform = new MetaColorTransform();
		}
		
		public function LoadFromFromRows(row0:Vector4, row1:Vector4):void {
			matrix.a = row0.x ; 
			matrix.b = row0.y ; 
			matrix.c = row1.x ; 
			matrix.d = row1.y ; 
			matrix.tx = row0.w ; 
			matrix.ty = row1.w ; 
	
			//[ a, -c, 0, x]
			//[-b,  d, 0, y]
			//
			//
			//_matrix3D.SetRow(0, row0);
			//_matrix3D.SetRow(1, row1);//Coute cher
			/*
			_rotation = Mathf.Asin(matrix.c);
			if(-matrix.b == matrix.c && !FlashUtils.myIsNan(rotation)) {
				_isUniform = true;
				var cos:Number = Mathf.Cos(_rotation);
				_scaleX = matrix.a/cos;
				_scaleY = matrix.d/cos;
			} else {
				_isUniform = false;
				_rotation = 0;  
			}*/
		}
		
		public function GetMatrix():Matrix4x4 {
			if( !_isDirty) return _matrix3D;
				
			_matrix3D.m00 = matrix.a;
			_matrix3D.m01 = matrix.b;
			_matrix3D.m10 = matrix.c;
			_matrix3D.m11 = matrix.d;
			_matrix3D.m03 = matrix.tx; //tx
			_matrix3D.m13 = matrix.ty; //ty
					
			_rotation = Math.sin(matrix.c);
			if(-matrix.b == matrix.c && !FlashUtils.myIsNan(rotation)) {
				_isUniform = true;
				var cos:Number = Math.cos(_rotation);
				_scaleX = matrix.a/cos;
				_scaleY = matrix.d/cos;
			} else {
				_isUniform = false;
				_rotation = 0;  
			}
			
			_isDirty = false;
			return _matrix3D;
		}
		
		public function get isUniform():Boolean { return _isUniform;};
		public function get rotation():Number { return _rotation;};
		public function get scaleX():Number { return _scaleX;};
		public function get scaleY():Number { return _scaleY;};
		public function get x():Number { return _x;};
		public function get y():Number { return _y;};
	}
}