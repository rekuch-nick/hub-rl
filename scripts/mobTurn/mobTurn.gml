function mobTurn(){
	
	var inMeleeWithPlayer = abs(xSpot - pc.xSpot) + abs(ySpot - pc.ySpot) == 1;
	
	var canSeePlayer = false;
	
	
	
	
	if(inMeleeWithPlayer){
		attack(id, pc);
	} else if(canSeePlayer){
		
	} else if(true){
		
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