function visionCheck(){
	
	var r = 14; var rr = 10;
	r = 6; rr = 5;
	
	for(var a=pc.xSpot - r; a<=pc.xSpot + r; a++){
		for(var b=pc.ySpot - rr; b<=pc.ySpot + rr; b++){
			if(!inBounds(a, b)){ continue; }
			
			ww.vmap[a, b] = false;
			var line = getLine(pc.xSpot, pc.ySpot, a, b);
			if(blockInsideLine(line) <= 0){
				ww.vmap[a, b] = true;
				ww.memMap[a, b] = ww.fmap[a, b].memImage;
				if(ww.bmap[a, b] != noone){
					ww.memMap[a, b] = ww.bmap[a, b].memImage;
				}
			}
		}
	}
	
	

}