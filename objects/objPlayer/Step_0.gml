input();




if(ww.state == State.tileSelect || ww.state == State.tileSelectLos){
	playerClickTile();
}





if(ww.state != State.play){ return; }






if(!charInPlace()){
	slideToPlace();
} else {
	if(!enteredTile){
		enteredTile = true;
		visionCheck();
	}
	
	if( (xIn != 0 xor yIn != 0) && icd < 1){
		if(xIn < 0){ facing = -1; }
		if(xIn > 0){ facing = 1; }
		
		var xt = xSpot + xIn;
		var yt = ySpot + yIn;
		
		if(charCanEnter(xt, yt)){
			enteredTile = false;
			timeShouldPass += 1;
			charEnter(xt, yt);
		} else if(inBounds(xt, yt)){
			
			if(ww.mmap[xt, yt] != noone && ww.mmap[xt, yt].aly == -1){
				timeShouldPass += 10;
				icd = 10;
				attack(pc, ww.mmap[xt, yt]);
				
				
				
			} else if(ww.bmap[xt, yt] != noone && ww.bmap[xt, yt].breakable){
				ww.bmap[xt, yt].hp -= 15;
				icd = 10;
				timeShouldPass = 1;
				if(ww.bmap[xt, yt].hp < 1){
					removeBlock(xt, yt);
					charBumpTowards(xt, yt);
					visionCheck();
				}
			}
			
		}
	} else if (clickSpace || holdSpaceTime > 30) {
		holdSpaceTime = 0;
		timeShouldPass = 1;
	}
	
	
	
	
	//debug
	if(keyboard_check_pressed(vk_f2)){
		ww.state = State.tileSelectLos;
	}
	
	
} //end of char is in place





