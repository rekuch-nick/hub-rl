input();




if(ww.state == State.tileSelect || ww.state == State.tileSelectLos){
	playerClickTile();
}





if(ww.state != State.play){ return; }

if(clickNO){
	instance_create_depth(0, 0, ww.layerScreen, objScreenInventory);
	return;
}




if(!charInPlace()){
	slideToPlace();
} else {
	if(!enteredTile){
		enteredTile = true;
		visionCheck();
		if(ww.fmap[xSpot, ySpot].sprite_index == imgFloorExit){ selfAction = Action.takeExit; }
	}
	
	if( ( (xIn != 0 xor yIn != 0) or (holdLM && yMouseUI > 0 && yMouseUI < 10 && !clickLM) )
			&& icd < 1){
				
		if(xIn == 0 && yIn == 0){
			if(disManhat(xSpot, ySpot, xMouse, yMouse) == 1){
				xIn = xMouse - xSpot;
				yIn = yMouse - ySpot;
			} else if(disManhat(xSpot, ySpot, xMouse, yMouse) == 2 &&
								xSpot != xMouse && ySpot != yMouse ){
				if(choose(true, false)){
					xIn = xMouse - xSpot;
				} else {
					yIn = yMouse - ySpot;
				}
			} else {
			
				var cords = pathing(pc.xSpot, pc.ySpot, xMouse, yMouse);
				if(cords != noone){
					if(cords.a > xSpot){ xIn ++; }
					if(cords.a < xSpot){ xIn --; }
					if(cords.b > ySpot){ yIn ++; }
					if(cords.b < ySpot){ yIn --; }
				}
			}
		}
		
		if(xIn < 0){ facing = -1; }
		if(xIn > 0){ facing = 1; }
		
		var xt = xSpot + xIn;
		var yt = ySpot + yIn;
		
		if(charCanEnter(xt, yt)){
			
			selfAction = noone;
			enteredTile = false;
			timeShouldPass += 1;
			if(charCanStep()){
				charEnter(xt, yt);
				playerCollectItem(xt, yt);
			} else {
				icd = 10;
			}
		} else if(inBounds(xt, yt)){
			
			if(ww.mmap[xt, yt] != noone && ww.mmap[xt, yt].aly == -1){
				timeShouldPass += 10;
				icd = 10;
				if(charCanAttack()){
					attack(pc, ww.mmap[xt, yt]);
				}
				
				
				
			} else if(ww.bmap[xt, yt] != noone && ww.bmap[xt, yt].digable){
				if(charCanAttack()){
					ww.bmap[xt, yt].hp -= 15;
				}
				icd = 6;
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
	} else if (clickEnter || (clickLM && xMouse == xSpot && yMouse == ySpot) ){
		if(selfAction == Action.takeExit){
			selfAction = noone;
			hp = clamp(hp + hpPerFloor + gearStats.hpPerFloor, 0, hpMax + gearStats.hp);
			mp = clamp(mp + mpPerFloor + gearStats.mpPerFloor, 0, mpMax + gearStats.mp);
			for(var i=0; i<120; i++){ buff[i] = 0; }
			buffPlayerUpdate();
			ww.state = State.genDeep;
		}
	} else if (keyIn == "Q"){
		playerItemUse(selected, true);
	} else if(keyIn == "Z"){
		playerItemUse(selected, false);
	} else if(clickLM && yMouseUI == 10 ){
		playerItemUse(xMouseUI, true);
	} else if(clickRM && yMouseUI > 0 && yMouseUI < 10){
		playerItemUse(selected, false);
	}
	
	
	
	
	
	
	
	
	
	
	
	//debug
	if(keyboard_check_pressed(vk_f2)){ 
		messageSpawn(string(irandom_range(0, 10000)), c_white)
	}
	
	
} //end of char is in place


if(timeShouldPass > 0){
	buffDecay(pc);
}


if(keyIn == "`"){ selected = 0; }
if(keyIn == "1"){ selected = 1; }
if(keyIn == "2"){ selected = 2; }
if(keyIn == "3"){ selected = 3; }
if(keyIn == "4"){ selected = 4; }
if(keyIn == "5"){ selected = 5; }
if(keyIn == "6"){ selected = 6; }
if(keyIn == "7"){ selected = 7; }
if(keyIn == "8"){ selected = 8; }
if(keyIn == "9"){ selected = 9; }
if(keyIn == "0"){ selected = 10; }
if(keyIn == "-"){ selected = 11; }
if(keyIn == "="){ selected = 12; }

selectNext(mouseWheelIn);


