function getLine(x1, y1, x2, y2){
	var points = [];
	var i = 0;
	
	var dx = abs(x2-x1);
	var dy = abs(y2-y1);
	var sx = x1 < x2 ? 1 : -1;
    var sy = y1 < y2 ? 1 : -1;
	var err = dx-dy;
	
	while(true){
		
		points[i] = getPoint(x1, y1); i ++;
		
		if(x1 == x2 && y1 == y2){ break; }
		
		var e2 = err * 2;
		if(e2 > -dy) {
			err -= dy;
			x1 += sx;
		}
		if(e2 < dx){
			err += dx;
			y1 += sy;
		}
	}
	
	return points;
}

function getPoint(aa, bb){
	return {a:aa, b:bb};
}

function blockInsideLine(l){
	var n = 0;
	
	for(var i=1; i<array_length(l) - 1; i++){
		if(ww.bmap[l[i].a, l[i].b] != noone){ n ++; }
	}
	
	return n;
}

function blockOrMobInsideLine(l){
	var n = 0;
	
	for(var i=1; i<array_length(l) - 1; i++){
		if(ww.bmap[l[i].a, l[i].b] != noone){ n ++; }
		if(ww.mmap[l[i].a, l[i].b] != noone){ n ++; }
	}
	
	return n;
}

function getPointCorner(x1, y1, x2, y2){
	var cs = [];
	if(x1 > x2){ cs[array_length(cs)] = {a: x1 - 1, b: y1 }; }
	if(x1 < x2){ cs[array_length(cs)] = {a: x1 + 1, b: y1 }; }
	if(y1 > y2){ cs[array_length(cs)] = {a: x1, b: y1 - 1 }; }
	if(y1 < y2){ cs[array_length(cs)] = {a: x1, b: y1 + 1 }; }
	
	var ccs = [];
	for(var i=0; i<array_length(cs); i++){
		if(charCanEnter(cs[i].a, cs[i].b)){
			ccs[array_length(ccs)] = cs[i];
		}
	}
	
	if(array_length(ccs) == 0){ return {a: x1, b: y1}; }
	
	return ccs[irandom_range(0, array_length(ccs) - 1)];
}