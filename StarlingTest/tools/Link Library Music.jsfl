var aItems = fl.getDocumentDOM().library.getSelectedItems();
var classNamePrefix = "com.starterkit.exported.sfx.";
var baseClassName = "flash.media.Sound";

if(baseClassName != null) {
	for (var i = 0 ; i < aItems.length ; i++) {
		aItems[i].name =  aItems[i].name.split(".")[0];
		var a = aItems[i].name.split("/");
		var theName = a[a.length-1];
		if(aItems[i].itemType == "folder") continue;
		aItems[i].linkageExportForAS = true;
		aItems[i].linkageExportInFirstFrame = true;
		aItems[i].linkageClassName = classNamePrefix + theName.toUpperCase();
		aItems[i].linkageBaseClass = baseClassName;
	}
}

fl.outputPanel.clear();
for (var i = 0 ; i < aItems.length ; i++) {
	var a = aItems[i].name.split("/");
	var theName = a[a.length-1]; 
	theName = theName.toUpperCase();
	var idName = "static public var ID_" + theName + ":int = pushClassLink(" + theName + ");";
	fl.outputPanel.trace(idName);
}

