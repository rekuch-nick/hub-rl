draw_self();

var a = 0; var b = 5;
for(var i=15; i<90; i++){
	drawInventorySlot(a, b, i);
	a ++;
	if(a >= 15){ a = 0; b ++; }
}

var a = 10; var b = 1;
for(var i=91; i<106; i++){
	if(pc.slotUsable[i]){ 
		drawInventorySlot(a, b, i);
	}
	a ++;
	if(a >= 15){ a = 10; b ++; }
}

if(selected != noone){
	draw_sprite_stretched(imgCursor, 0, xSelected * 64, ySelected * 64, 64, 64);
}


var cords = inventoryCords(pc.xMouseUI, pc.yMouseUI);
if(cords != noone && pc.slotUsable[cords] && pc.bag[cords] != noone){
	draw_rectangle_color(32, 96, 544, 288, c_black, c_black, c_black, c_black, false);
	draw_text_ext(64, 128, itemDesc(pc.bag[cords]), 32, 448);
}