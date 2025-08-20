if(!tileOnScreen()){ return; }

if(!ww.vmap[xSpot][ySpot] && !pc.debugMode){ 
	if(ww.memMap[xSpot, ySpot] != noone){
		draw_sprite_stretched(ww.memMap[xSpot, ySpot], 0, x, y, 64, 64);
	}
} else {
	draw_self();
}