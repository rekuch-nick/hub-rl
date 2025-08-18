function worldGenDeep(){
	pc.deep ++;
	worldGenBlank();
	
	xMin = 75; xMax = 76;
	yMin = 55; yMax = 56;
	var roomSize = 8;
	xMin = clamp(xMin - roomSize, 0, 150);
	xMax = clamp(xMax + roomSize, 0, 150);
	yMin = clamp(yMin - roomSize, 0, 110);
	yMax = clamp(yMax + roomSize, 0, 110);
	
	worldGenPatches();
	//worldGenMazeFrom(pc.xSpot, pc.ySpot);
	//repeat(10){ worldGenReplaceBlockRandomOnWall(imgBlock, noone); }
	
	repeat(10){ mobSpawnRandom(); }
	
	worldGenCostume(imgFloorCave, imgBlockCave);
	worldGenImpl();
	ww.state = State.play;
}



function worldGenBlank(){
	
	xMin = 0; yMin = 0;
	xMax = 150; yMax = 110;
	
	for(var a=xMin; a<xMax; a++){ for(var b=yMin; b<yMax; b++){
		fmap[a, b] = imgFloor;
		bmap[a, b] = imgBlock;
		pmap[a, b] = noone;
		mmap[a, b] = noone;
	}}
	mmap[pc.xSpot, pc.ySpot] = pc;
	
}


function worldGenImpl(){
	
	for(var a=0; a<150; a++){ for(var b=0; b<110; b++){
		var f = fmap[a, b];
		if(f != noone){
			var o = objTile;
			fmap[a, b] = instance_create_depth(a * 64, b * 64, layerFloor, o);
			fmap[a, b].sprite_index = f;
		}
		
		var w = bmap[a, b];
		if(w != noone){
			var o = objBlock;
			bmap[a, b] = instance_create_depth(a * 64, b * 64, layerBlock, o);
			bmap[a, b].sprite_index = w;
			if(w == imgBlockCave){ bmap[a, b].breakable = true; }
			
			if(a == 0 || b == 0 || a == 149 || b == 109){ bmap[a, b].breakable = false; }
		}
	}}
	
}

function worldGenCostume(fImage, bImage){
	for(var a=xMin; a<xMax; a++){ for(var b=yMin; b<yMax; b++){
		if(fmap[a, b] == imgFloor){ fmap[a, b] = imgFloorCave; }
		if(bmap[a, b] == imgBlock){ bmap[a, b] = imgBlockCave; }
	}}
}


