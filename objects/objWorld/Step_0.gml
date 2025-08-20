if(state == State.genDeep){
	worldGenDeep();
}



if(state == State.ani){
	if(instance_number(effThrowable) < 1){
		ww.state = State.play;
	}
}

if(state != State.play){ return; }

if(pc.timeShouldPass > 0){
	with(objMob){
		mobTurn();
	}
	
	pc.timeShouldPass = 0;
}