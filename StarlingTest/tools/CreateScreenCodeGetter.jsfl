var aID = new Array();
var dynamicTextNum = 0;


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
			
			//TraceStart(libItem);
			TraceGetter();
			//TraceEnd(libItem);
		}
	}
	
}

function TraceStart(libItem) {
	var screenName = GetShortName(libItem);
	var screenNameUpper = screenName.toUpperCase();
	fl.outputPanel.trace("package " + classNamePrefix + "{ \n") ;
	fl.outputPanel.trace("/**") ;
	fl.outputPanel.trace(" * @author Lachhh") ;
	fl.outputPanel.trace(" */") ;
	fl.outputPanel.trace("	public class " + screenName + " extends " + superClass + " {") ;
	fl.outputPanel.trace("		override public function CreateVisual() : Animation {") ;
	fl.outputPanel.trace("			return AnimationManager.instance.CreateAnimation(" + gameInitial + "AnimationFactory.ID_" + screenNameUpper + ");");
	fl.outputPanel.trace("		}\n");
	
		
	
}
	
function TraceGetter() {
	for (var s in aID) {
		fl.outputPanel.trace("		" + aID[s]);
	}
}

function TraceEnd(libItem) {
	fl.outputPanel.trace("	}");
	fl.outputPanel.trace("}");
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