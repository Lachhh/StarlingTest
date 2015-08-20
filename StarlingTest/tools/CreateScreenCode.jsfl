var aID = new Array();
var aClassID = new Array();
var dynamicTextNum = 0;

var classNamePrefix = "com.starterkit";
var superClass  = "UIBase";

var classCode = "";

function GetShortName(item) {

	var a = item.name.split("/");
	var theName = a[a.length-1];
	return theName;
}


function Init() {
	fl.outputPanel.clear();
	var aItems = fl.getDocumentDOM().library.getSelectedItems();
	for (var iLb = 0 ; iLb < aItems.length ; iLb++) {
		var libItem = aItems[iLb];
		if(libItem.itemType == "movie clip" && libItem.linkageURL == null) {
			aID = new Array();
			
			fl.getDocumentDOM().library.editItem(libItem.name);
			SearchTimeLine(libItem.timeline);
			
			TraceStart(libItem);
			TraceGetter();
			TraceEnd(libItem);
			var screenName = GetShortName(libItem);
			var className = screenName.split("_").join("");
			FLfile.write("file:///c|/temp/" + className + ".as", classCode); 
			
			var screenName = GetShortName(libItem);
			var className = screenName.split("_").join("");
			var screenNameUpper = screenName.toUpperCase();
	
			var id = "ID_" + screenNameUpper;
			var factoryCode = id + " = PushClassLink(" + className + ");";
			aClassID[id] = factoryCode;
			
			fl.outputPanel.trace("File Created at : c:/temp/" + className + ".as");
			classCode = "";
			
		}
	}
	
	/*fl.outputPanel.trace("//Factory code");
	for (var s in aClassID) {
		fl.outputPanel.trace("static public var " + s + ":int ;");
	}
	fl.outputPanel.trace("");
	for (var s in aClassID) {
		fl.outputPanel.trace(aClassID[s]);
	}*/
}

function TraceStart(libItem) {
	var screenName = GetShortName(libItem);
	var className = screenName.split("_").join("");
	var screenNameUpper = screenName.toUpperCase();
	
	classCode += ("package " + classNamePrefix + ".ui { \n") ;
	classCode += ("	import " + classNamePrefix  + ".animation.AnimationFactory;\n") ;
	classCode += ("	import com.lachhh.lachhhengine.ui.UIBase;\n") ;
	classCode += ("	import flash.display.MovieClip;\n") ;
	classCode += ("	import flash.text.TextField;\n") ;
	classCode += ("/**\n") ;
	classCode += (" * @author Lachhh\n") ;
	classCode += (" */\n") ;
	classCode += ("	public class " + className + " extends " + superClass + " {\n") ;
	classCode += ("		public function " + className + "() {\n") ;
	classCode += ("			super(AnimationFactory.ID_" + screenNameUpper + ");\n");
	classCode += ("		}\n");
	
		
	
}
	
function TraceGetter() {
	for (var s in aID) {
		classCode += ("		" + aID[s] + "\n");
	}
}

function TraceEnd(libItem) {
	classCode += ("	}\n");
	classCode += ("}");
}

function SearchTimeLine(t) {
	dynamicTextNum = 0;
	
	for (var i = 0 ; i < t.layers.length ; i++) {
		var l = t.layers[i];
		fl.getDocumentDOM().getTimeline().setSelectedLayers(i);
		SearchLayer(l);
	}
}

function SearchLayer(l) {
	for (var j = 0 ; j < l.frames.length ; j++) {
		var f = l.frames[j];
		var locked = l.locked ;
		var visible = l.visible ;
		l.locked = false;
		l.visible = true;
		fl.getDocumentDOM().getTimeline().setSelectedFrames(j,j);
		SearchFrame(f);
		l.visible = visible ;
		l.locked = locked ;
		j += f.duration-1;
	}
}

function SearchFrame(f) {
	for (var k = 0 ; k < f.elements.length ; k++) {
		var elem = f.elements[k];
		CheckElement(elem, f);
	}
}


function CheckElement(e, f) {
	var txtID = e.name;
	if(aID[txtID] != undefined || e.name == "") return ;
	if(e.elementType == "text") {
		if(e.textType == "input" || e.textType == "dynamic") {
			//Si static ou dynamic
			
			var code = 'public function get ' + txtID + '():TextField { return (visual.getChildByName("' + txtID + '")) as TextField;}';
			aID[txtID] = code;
		} 
	} else if(e.elementType == "instance") {
		var code1 = 'public function get ' + txtID + '():MovieClip { return (visual.getChildByName("' + txtID + '")) as MovieClip;}';
		aID[txtID] = code1;
	}
}

Init();