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
	repeat(2){ itemSpawnRandom(); }
	
	//force stairs or crash!
	if(!worldGenReplaceFloorCornerEmpty(imgFloor, imgFloorExit)){
		while(!worldGenReplaceFloorEmpty(imgFloor, imgFloorExit)){}
	};
	
	worldGenCostume(imgFloorCave, imgBlockCave);
	worldGenImpl();
	ww.state = State.play;
}



function worldGenBlank(){
	with(objTile){ instance_destroy(); }
	with(objMob){ instance_destroy(); }
	with(objPup){ instance_destroy(); }
	
	xMin = 0; yMin = 0;
	xMax = 150; yMax = 110;
	
	for(var a=xMin; a<xMax; a++){ for(var b=yMin; b<yMax; b++){
		fmap[a, b] = imgFloor;
		bmap[a, b] = imgBlock;
		pmap[a, b] = noone;
		mmap[a, b] = noone;
		memMap[a, b] = noone;
		vmap[a, b] = false;
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
			fmap[a, b].isFloor = true;
			fmap[a, b].xSpot = a; fmap[a, b].ySpot = b;
		}
		
		var w = bmap[a, b];
		if(w != noone){
			var o = objBlock;
			bmap[a, b] = instance_create_depth(a * 64, b * 64, layerBlock, o);
			bmap[a, b].sprite_index = w;
			bmap[a, b].isBlock = true;
			bmap[a, b].xSpot = a; bmap[a, b].ySpot = b;
			
			if(w == imgBlockCave){ bmap[a, b].breakable = true; }
			
			if(a == 0 || b == 0 || a == 149 || b == 109){ bmap[a, b].breakable = false; }
		}
	}}
	
	visionCheck();
}

function worldGenCostume(fImage, bImage){
	for(var a=xMin; a<xMax; a++){ for(var b=yMin; b<yMax; b++){
		if(fmap[a, b] == imgFloor){ fmap[a, b] = imgFloorCave; }
		if(bmap[a, b] == imgBlock){ bmap[a, b] = imgBlockCave; }
	}}
}


