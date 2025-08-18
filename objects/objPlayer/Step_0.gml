input();



if(ww.state != State.play){ return; }






if(!charInPlace()){
	slideToPlace();
} else {
	
	if(xIn != 0 xor yIn != 0){
		if(xIn < 0){ facing = -1; }
		if(xIn > 0){ facing = 1; }
		
		var xt = xSpot + xIn;
		var yt = ySpot + yIn;
		
		if(charCanEnter(xt, yt)){
			timeShouldPass += 1;
			charEnter(xt, yt);
		} else if(inBounds(xt, yt)){
			
			if(ww.mmap[xt, yt] != noone && ww.mmap[xt, yt].aly == -1){
				timeShouldPass += 10;
				attack(pc, ww.mmap[xt, yt]);
				
				
			} else if(ww.bmap[xt, yt] != noone && ww.bmap[xt, yt].breakable){
				ww.bmap[xt, yt].hp --;
				if(ww.bmap[xt, yt].hp < 1){
					removeBlock(xt, yt);
					charBumpTowards(xt, yt);
				}
			}
			
		}
	}
	
}




