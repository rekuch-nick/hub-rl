x = pc.xMouse * 64;
y = pc.yMouse * 64;
line = getLine(pc.xSpot, pc.ySpot, pc.xMouse, pc.yMouse);

if(ww.state == State.tileSelectLos){
	
	line = getLine(pc.xSpot, pc.ySpot, pc.xMouse, pc.yMouse);
	while(blockOrMobInsideLine(line) > 0){
		var ll = [];
		for(var i=0; i<array_length(line) - 1; i++){
			ll[i] = line[i];
		}
		line = ll;
	}
	x = line[array_length(line) - 1].a * 64;
	y = line[array_length(line) - 1].b * 64;
		
}

if(ww.state == State.tileSelectLos or ww.state == State.tileSelect){
	if(pc.throwing != noone){
		if(pc.throwing.throwRange != -1){
			while(array_length(line) > pc.throwing.throwRange){
				var ll = [];
				for(var i=0; i<array_length(line) - 1; i++){
					ll[i] = line[i];
				}
				line = ll;	
			}
			x = line[array_length(line) - 1].a * 64;
			y = line[array_length(line) - 1].b * 64;
		}
	}
}


