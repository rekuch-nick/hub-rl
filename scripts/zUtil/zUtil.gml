function scale(){
	image_xscale = 2; image_yscale = 2;
}

enum State { title, play, tileSelect, tileSelectLos, pause, flee, genHub, genDeep, inventory, ani, }
enum Mode { arcade, story }
enum Ele { phys, fire, bio, water, holy, dark, arcane }
enum Buff { 
	stun, burning,
	poison, weak, blind, frozen, cold,
	haste, might, regen, 
	warm, sightUP, sightUPTorch, 
	
}
enum Slot { wep, arm, trink, boot, spec, helm };
enum Perk {
	seeHP, idPotions, 
}
enum Target {
	self, dir, cur, inventory,
}
enum Action {
	takeExit, readSign, enterShop,
}


function inBounds(a, b){
	return a >= 0 && b >= 0 && a < 150 && b < 110;
}

function inBoundsMinMax(a, b){
	return a >= ww.xMin && b >= ww.yMin && a < ww.xMax && b < ww.yMax;
}

function roll(n){
	return irandom_range(0, 99) < n;
}

function disManhat(x1, y1, x2, y2){
	return abs(x1 - x2) + abs(y1 - y2);
}

function tileOnScreen(){
	var cam = view_camera[0];
	return x >= camera_get_view_x(cam) - 64 && y >= camera_get_view_y(cam) &&
		x < camera_get_view_x(cam) + camera_get_view_width(cam) &&
		y < camera_get_view_y(cam) + camera_get_view_height(cam);
}