package com.lachhh.flash.preloader {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * @author Simon Lachance
	 */
	public class BerzerkLoader  {
		private var _bmp : Bitmap ;
		private var _drawMc:MovieClip ;
		private var _oldPrct:Number = 0;
		private var _crntPrct:Number = 0;
		private var _wait:int = 2;
		private var _destroyed:Boolean = false;
		private var _visual : BERZERK_LOADER;

		public function BerzerkLoader() {
			_bmp  = new Bitmap(new BitmapData(114,114, true,0x00000000));
			_drawMc = new MovieClip();
			_bmp.x = -57;
			_bmp.y = -57;
			_visual = new BERZERK_LOADER();
			MovieClip(MovieClip(_visual.getChildByName("logo")).getChildByName("rond")).addChild(_bmp);
			
		}
		
		public function ShowProgress(prct:Number):void {
			_crntPrct = prct;
		}
		
		public function Update():void {
			if(_destroyed) return ;
			if(_oldPrct < _crntPrct) {
				var diff:Number = (_crntPrct-_oldPrct)*0.1;
				DrawQuadrant(_bmp, 57, _oldPrct, _oldPrct+diff);
				_oldPrct += diff;
			} else if(_oldPrct<0.95){
				_wait--;
				if(_wait < 0){
					DrawQuadrant(_bmp, 57, _oldPrct, _oldPrct+0.005);
					_oldPrct+= 0.005;
					_wait = 2;
				}
			}		
		}
		
		public function DrawQuadrant(bmp:Bitmap, radius:Number, startPrct:Number, endPrct:Number):void {
			var goPoint:Point = new Point();
		
			_drawMc.graphics.clear();
			_drawMc.graphics.lineStyle(1,0xFFFFFF, 0.25);
			
			while(startPrct < endPrct) {
				goPoint.x = Math.cos((Math.PI*2)*startPrct - Math.PI/2)*radius;
				goPoint.y = Math.sin((Math.PI*2)*startPrct - Math.PI/2)*radius;
				
				_drawMc.graphics.moveTo(0,0);
				_drawMc.graphics.lineTo(goPoint.x,goPoint.y);
				startPrct+= 0.005;
			}
		
			bmp.bitmapData.draw(_drawMc, new Matrix(1,0,0,1,-bmp.x,-bmp.y));
		}
		
		public function get visual() : BERZERK_LOADER {
			return _visual;
		}
	}
}
