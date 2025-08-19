event_inherited();
if(disManhat(xSpot, ySpot, pc.xSpot, pc.ySpot) >= 24){ return; }


if(!ww.vmap[xSpot][ySpot] && !pc.debugMode){ return; }

if(hp < hpMax){
	var f = 5 - floor((hp / hpMax) * 5);
		
	draw_sprite_stretched(imgCrack, f, x, y, 64, 64);
}