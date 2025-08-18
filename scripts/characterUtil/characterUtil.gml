function charSetLocation(a, b){
	x = a * 64; y = b * 64;
}

function charSetLocationBySpot(){
	charSetLocation(xSpot, ySpot);
}

function charSetPlace(){
	xInPlace = xSpot * 64;
	yInPlace = ySpot * 64;
}

function charInPlace(){
	x = floor(x); y = floor(y);
	charSetPlace();
	return x == xSpot * 64 && y == ySpot * 64;
}

function slideToPlace(){
	if(x < xInPlace){ x += slideSpeed; }
	if(x > xInPlace){ x -= slideSpeed; }
	if(y < yInPlace){ y += slideSpeed; }
	if(y > yInPlace){ y -= slideSpeed; }
	
	if(abs(x - xInPlace) < slideSpeed){ x = xInPlace; }
	if(abs(y - yInPlace) < slideSpeed){ y = yInPlace; }
	
}

function charEnter(a, b){
	var charInDest = ww.mmap[a, b];
	xLast = xSpot; yLast = ySpot;
	
	ww.mmap[a, b] = id;
	ww.mmap[xSpot, ySpot] = charInDest;
	
	if(charInDest != noone){
		charInDest.xSpot = xSpot;
		charInDest.ySpot = ySpot;
	}
	
	xSpot = a;
	ySpot = b;
	charSetPlace();
}

function charCanEnter(a, b){
	if(!inBounds(a, b)){ return false; }
	
	var canIgnoreBlock = false;
	if(id == pc && pc.debugMode){ canIgnoreBlock = true; }
	if(!canIgnoreBlock && ww.bmap[a, b] != noone){ return false; }
	
	if(ww.mmap[a, b] != noone){
		if(id != pc || aly != ww.mmap[a, b].aly){ return false; }
	}
	
	return true;
}


function charDrawSelf(){
	if(facing != 1){
		draw_sprite_ext(sprite_index, image_index, x + abs(sprite_width), y, -image_xscale, image_yscale, image_angle, c_white, image_alpha);
	} else {
		draw_self();
	}
}

function charBumpTowards(a, b){
	if(xSpot < a){ x += 32; }
	if(xSpot > a){ x -= 32; }
	if(ySpot < b){ y += 32; }
	if(ySpot > b){ y -= 32; }
}