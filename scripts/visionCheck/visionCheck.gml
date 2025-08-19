function visionCheck(){
	
	
	for(var a=pc.xSpot - 14; a<=pc.xSpot + 14; a++){
		for(var b=pc.ySpot - 10; b<=pc.ySpot + 10; b++){
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