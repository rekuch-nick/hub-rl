function mobTurn(){
	if(hp < 1){ return; }
	
	var inMeleeWithPlayer = (abs(xSpot - pc.xSpot) + abs(ySpot - pc.ySpot) == 1 ) or
		(	attackDiag &&
			(abs(xSpot - pc.xSpot) + abs(ySpot - pc.ySpot) == 2 ) &&
			xSpot != pc.xSpot && ySpot != pc.ySpot );
	
	
	
	var canSeePlayer = false;
	if(disManhat(xSpot, ySpot, pc.xSpot, pc.ySpot) <= detectionRange){
		var line = getLine(xSpot, ySpot, pc.xSpot, pc.ySpot);
		if(blockInsideLine(line) == 0){ canSeePlayer = true; }
	}
	
	
	
	
	if(inMeleeWithPlayer){
		var cords = getPointCorner(xSpot, ySpot, pc.xSpot, pc.ySpot);
		
		if(abs(xSpot - pc.xSpot) + abs(ySpot - pc.ySpot) == 2 && roll(meleeCloseChance) && 
			(cords.a != xSpot or cords.b != ySpot) ){
			charEnter(cords.a, cords.b);
		} else {
			attack(id, pc);
		}
		
	} else if(canSeePlayer && roll(huntChance) ){
		var nextCord = pathing(xSpot, ySpot, pc.xSpot, pc.ySpot);
		if(nextCord != noone){
			if(charCanEnter(nextCord.a, nextCord.b)){
				charEnter(nextCord.a, nextCord.b);
			}
		}
	} else if(roll(wanderChance)){
		
		var arr = [];
		if(charCanEnter(xSpot, ySpot - 1)){ arr[array_length(arr)] = {a: xSpot, b: ySpot - 1}; }
		if(charCanEnter(xSpot + 1, ySpot)){ arr[array_length(arr)] = {a: xSpot + 1, b: ySpot}; }
		if(charCanEnter(xSpot, ySpot + 1)){ arr[array_length(arr)] = {a: xSpot, b: ySpot + 1}; }
		if(charCanEnter(xSpot - 1, ySpot)){ arr[array_length(arr)] = {a: xSpot - 1, b: ySpot}; }
		
		if(array_length(arr) > 0){
			var cords = arr[irandom_range(0, array_length(arr) - 1)];
			charEnter(cords.a, cords.b);
		}
	}
	
	
	
	justAttacked = false;
}