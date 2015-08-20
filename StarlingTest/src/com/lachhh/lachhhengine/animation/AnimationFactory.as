package com.lachhh.lachhhengine.animation {
	import com.animation.exported.*;
	import com.lachhh.flash.FlashAnimation;

	import flash.display.MovieClip;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author LachhhSSD
	 */
	public class AnimationFactory {
		static public var allAnimationClass:Vector.<Class> = new Vector.<Class>();
		static public var EMPTY:int = pushClassLink(FlashAnimation);
		static public var ID_UI_DEBUG:int = pushClassLink(UI_DEBUG);
		
		static public function pushClassLink(pClass:Class):int {
			allAnimationClass.push(pClass);
			return (allAnimationClass.length-1);
		}

		static public function pushBtnLink(pClass:Class):int {
			//Dummy Function, only need the button ref to force export.  
			return -1;
		}

		static public function createAnimationInstance(instanceType:int):MovieClip {
			if(allAnimationClass[instanceType] == null) {
				throw new Error("Invalid ID");
			}
			
			var animationClass:Class = allAnimationClass[instanceType];
			
			return new animationClass();
		}
	
		
		static public function getClassAt(i:int):Class {
			return allAnimationClass[i];
		}
		
		static public function getNbClass():int {
			return allAnimationClass.length;
		}
		
		static public function DEBUG_FindIdByString(className:String):int {
			for (var i:int = 0 ; i < allAnimationClass.length ; i++) { 
				var theClass:Class = allAnimationClass[i];
				var exportedClassName:String = getQualifiedClassName(theClass).split("::").join(".");
				var importedClassName:String = exportedClassName.split(".imported.").join(".exported."); 
				if(exportedClassName == className) return i;
				if(importedClassName == className) return i;
			}
			return -1;
		}
		
		static public function DEBUG_ReplaceClassLink(pClass:Class, i:int):void {
			if(allAnimationClass[i] == null) {
				throw new Error("Class at " + i + "is null. Can't replace");
			}
			allAnimationClass[i] = pClass;
		} 
	
		static public function findIdByString(className:String):int {
			for (var i:int = 0 ; i < allAnimationClass.length ; i++) { 
				var theClass:Class = allAnimationClass[i];
				var exportedClassName:String = getQualifiedClassName(theClass).split("::").join(".");
				var importedClassName:String = exportedClassName.split(".imported.").join(".exported."); 
				if(exportedClassName == className) return i;
				if(importedClassName == className) return i;
			}
			return -1;
		} 
	}
}
