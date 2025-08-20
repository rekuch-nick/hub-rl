function playerClickTile(){
	
	if(clickRM || clickNO){ 
		throwing = noone;
		clickRM = false; 
		clickNO = false;
		ww.state = State.play; return; 
	}
	
	
	if(clickLM && (xMouse != xSpot or yMouse != ySpot) ){		
		playerItemUseThrown(throwing, floor(cur.x / 64), floor(cur.y / 64));
	}
	
}