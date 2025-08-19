function scale(){
	image_xscale = 2; image_yscale = 2;
}

enum State { title, play, tileSelect, tileSelectLos, pause, flee, genHub, genDeep }

enum Ele { phys, fire, bio, water, holy, dark, arcane }
enum Buff { 
	poison, burning, weak, blind,
	haste, might, regen,
}
enum Slot { wep, arm, trink };
enum Perk {
	seeHP, idPotions, 
}
enum Target {
	self, dir, cur, inventory,
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