var aItems = fl.getDocumentDOM().library.getSelectedItems();
var classNamePrefix = "com.animation.exported.";
var baseClassName = "com.lachhh.flash.ui.ButtonSelect";

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
	return theName;
}


fl.outputPanel.clear();
for (var i = 0 ; i < alphaOrder.length ; i++) {
	var theName = alphaOrder[i]; 
	theName = theName.toUpperCase();
	var idName = "static public var ZZ_" + theName + ":int = " + "pushBtnLink(" + theName + ");";
	fl.outputPanel.trace(idName);
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