function mobSpawnRandom(){
	var tries = 0;
	var m = objMob;
	
	while(tries < 1000){
		tries ++;
		
		var a = irandom_range(ww.xMin, ww.xMax - 1);
		var b = irandom_range(ww.yMin, ww.yMax - 1);
		
		if(ww.bmap[a, b] != noone){ continue; }
		if(ww.mmap[a, b] != noone){ continue; }
		
		ww.mmap[a, b] = instance_create_depth(a * 64, b * 64, ww.layerMob, m);
		
		return;
	}
}