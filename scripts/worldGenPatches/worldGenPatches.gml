function worldGenPatches(){
	
	
	for(var a=xMin; a<xMax; a++){ for(var b=yMin; b<yMax; b++){
		bmap[a, b] = choose(noone, imgBlock);
	}}
	
	
	for(var a=pc.xSpot - 2; a<=pc.xSpot + 2; a++){
		for(var b=pc.ySpot - 2; b<=pc.ySpot + 2; b++){
			if(!inBounds(a, b)){ continue; }
			bmap[a, b] = noone;
		}
	}
	
	repeat(2){
		bmap = worldGenSmooth(bmap, noone, imgBlock);
	}
	
}


function worldGenSmooth(arr, t1, t2){
	
	for(var a=0; a<150; a++){ for(var b=0; b<110; b++){
		old[a, b] = arr[a, b];
	}}
	
	for(var a=xMin; a<xMax; a++){ for(var b=yMin; b<yMax; b++){
		
		var t1Count = 0;
		var t2Count = 0;
		
		for(var aa=a-1; aa<=a+1; aa++){
			for(var bb=b-1; bb<=b+1; bb++){
				if(!inBounds(aa, bb)){ continue; }
				if(a == aa && b == bb){ continue; }
				
				if(old[aa, bb] == t1){ t1Count ++; }
				if(old[aa, bb] == t2){ t2Count ++; }
			}
		}
		
		if(t1Count > t2Count){ arr[a, b] = t1; }
		if(t1Count < t2Count){ arr[a, b] = t2; }
	}}
	
	return arr;
	
}