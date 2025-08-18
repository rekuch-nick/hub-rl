if(state == State.genDeep){
	worldGenDeep();
}





if(state != State.play){ return; }

if(pc.timeShouldPass > 0){
	with(objMob){
		mobTurn();
	}
	
	pc.timeShouldPass = 0;
}