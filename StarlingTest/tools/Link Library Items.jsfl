var aItems = fl.getDocumentDOM().library.getSelectedItems();
var classNamePrefix = "com.animation.exported.";
var baseClassName = "com.lachhh.flash.FlashAnimation";

var alphaOrder = [];


if(baseClassName != null) {
	for (var i = 0 ; i < aItems.length ; i++) {
		var theName = GetShortName(aItems[i]);
		if(aItems[i].itemType == "folder") continue;
		aItems[i].linkageExportForAS = true;
		aItems[i].linkageExportInFirstFrame = true;
		aItems[i].linkageClassName = classNamePrefix + theName.toUpperCase();
		aItems[i].linkageBaseClass = baseClassName;
		
		alphaOrder.push(theName)
	}
}
alphaOrder.sort();
function GetShortName(item) {
	var a = item.name.split("/");
	var theName = a[a.length-1];
	theName = theName.split(" ").join("_");
	item.name = theName;
	return theName;
}


fl.outputPanel.clear();
for (var i = 0 ; i < alphaOrder.length ; i++) {
	var theName = alphaOrder[i]; 
	theName = theName.toUpperCase();
	theName = theName.split(" ").join("_");
	//Replace(theName, [32], "_");
	var idName = "static public var ID_" + theName + ":int = " + "pushClassLink(" + theName + ");";
	fl.outputPanel.trace(idName);
}

function Replace(s, chrCodeArray, by) {
	for (var i = 0 ; i < s.length ; i++) {
		var c = s.substr(i,1);
		
		for (var j = 0 ; j < chrCodeArray.length ; j++) {
			if(s.charCodeAt(i) == chrCodeArray[j]) {
				s = s.split(s.substr(i,1)).join(by[j]);
				break;
			}
		}
		
		if(i > 1000) {
			break;
		}
	}	
	return s
}

/*
fl.outputPanel.trace("");
fl.outputPanel.trace("");
fl.outputPanel.trace("");

for (var i = 0 ; i < alphaOrder.length ; i++) {
	var theName = alphaOrder[i]; 
	theName = theName.toUpperCase();
	var idName = "ID_" + theName + " = ";
	fl.outputPanel.trace(idName + "PushClassLink(" + theName + ");");
}
*/
