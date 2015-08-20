var stuff = fl.getDocumentDOM().selection
var prefix = prompt("Enter Prefix", "item"); 
var threshold = 10 ;

stuff.sort(sortOnXy);

for (var i = 0 ; i < stuff.length ; i++) {
	stuff[i].name = prefix + i ;
}

function sortOnXy(a, b) {
	if(Math.abs(a.y - b.y) < threshold) {
		if(a.x > b.x) {
			return 1;
		} else {
			return -1;
		}
		
	} else if(a.y < b.y) {
		return -1;
	} else {
		return 1;
	}
}