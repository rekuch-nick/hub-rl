if(!tileOnScreen()){ return; }
if(!ww.vmap[xSpot][ySpot] && !pc.debugMode){ return; }

charDrawSelf();


if(hp < hpMax){
	var w = 64 * (max(hp, 0) / hpMax);
	draw_rectangle_color(x, y, x + w, y + 2, c_red, c_maroon, c_red, c_maroon, false);
}