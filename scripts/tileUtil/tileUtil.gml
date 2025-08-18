function removeBlock(a, b){
	if(!inBounds(a, b)){ return; }
	if(ww.bmap[a, b] == noone){ return; }
	
	instance_destroy(ww.bmap[a, b]);
	ww.bmap[a, b] = noone;
}