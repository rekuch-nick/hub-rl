function itemSpawnRandom(){
	var tries = 0;
	var i = Item.rock;
	
	while(tries < 1000){
		tries ++;
		
		var a = irandom_range(ww.xMin, ww.xMax - 1);
		var b = irandom_range(ww.yMin, ww.yMax - 1);
		
		if(ww.bmap[a, b] != noone){ continue; }
		if(ww.pmap[a, b] != noone){ continue; }
		
		ww.pmap[a, b] = instance_create_depth(a * 64, b * 64, ww.layerPup, objPup);
		ww.pmap[a, b].xSpot = a; ww.pmap[a, b].ySpot = b;
		i = itemConstants(i);
		ww.pmap[a, b].item = i;
		ww.pmap[a, b].sprite_index = i.img;
		
		return;
	}
}

function spawnItem(i, a, b){
	if(ww.bmap[a, b] != noone){ return spawnItemWide(i, a, b); }
	if(ww.pmap[a, b] != noone){ return spawnItemWide(i, a, b); }
	
	ww.pmap[a, b] = instance_create_depth(a * 64, b * 64, ww.layerPup, objPup);
	ww.pmap[a, b].xSpot = a; ww.pmap[a, b].ySpot = b;
	i = itemConstants(i);
	ww.pmap[a, b].item = i;
	ww.pmap[a, b].sprite_index = i.img;
}

function spawnItemWide(i, aa, bb){
	var tries = 0;
	while(tries < 1000){
		tries ++;
		n = tries < 30 ? 1 : 2;
		if(tries > 300){ n ++; }
		if(tries > 600){ n ++; }
		var a = irandom_range(aa - n, aa + n);
		var b = irandom_range(bb - n, bb + n);
		
		if(!inBounds(a, b)){ continue; }
		if(ww.bmap[a, b] != noone){ continue; }
		if(ww.pmap[a, b] != noone){ continue; }
		
		spawnItem(i, a, b);
		return;
	}
	return false;
}

function playerHasItemAt(i){
	for(var j=0; j<120; j++){
		if(pc.bag[j] != noone && pc.bag[j].ii == i){
			return j;
		}
	}
	return noone;
}

function playerLowestEmptySlot(){
	for(var i=0; i<90; i++){
		if(pc.bag[i] == noone){
			return i;
		}
	}
	return noone;
}

function playerCollectItem(a, b){
	if(ww.pmap[a, b] == noone){ return; }
	var got = false;
	
	var i = ww.pmap[a, b].item;
	var s = playerHasItemAt(i.ii);
	if(i.stackable && s != noone){
		pc.bag[s].quantity += i.quantity;
		got = true;
	} else {
		s = playerLowestEmptySlot();
		if(s != noone){
			pc.bag[s] = i;
			got = true;
		}
	}
	
	if(got){
		instance_destroy(ww.pmap[a, b]);
		ww.pmap[a, b] = noone;
	}
}

function playerConsumeItem(i){
	var s = playerHasItemAt(i.ii);
	if(s == noone){ return; }
	pc.bag[s].quantity --;
	if(pc.bag[s].quantity < 1){
		pc.bag[s] = noone;
	}
}