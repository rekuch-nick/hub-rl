function drawInventorySlot(a, b, n){
	
	draw_sprite_stretched(imgInventorySlot, 0, a * 64, b * 64, 64, 64);
	
	
	
	if(pc.bag[n] != noone){
		var itm = pc.bag[n];
		if(itm.imgBG != noone){ draw_sprite_stretched(itm.imgBG, 0, a * 64, b * 64, 64, 64); }
		draw_sprite_stretched(itm.img, 0, a * 64, b * 64, 64, 64);
	}
	
	if(ww.state == State.play || ww.state == State.tileSelect || ww.state == State.tileSelectLos){
		if(pc.selected == n){
			draw_sprite_stretched(imgCursor, 0, a * 64, b * 64, 64, 64);
		}
	}
		
	if(pc.bag[n] != noone){
		if(itm.quantity > 1){
			draw_set_halign(fa_right);
			draw_text(a * 64 + 64, b * 64 + 48, string(itm.quantity));
			draw_set_halign(fa_left);
		}
	}
	
	
}



function inventoryCords(a, b){
	if(b == 10){ return a; }
	if(b >= 5 && b <= 9){
		return ((b - 4) * 15) + a;
	}
	if(b >= 1 && b <= 3 && a >= 10){
		return 91 + ( (b - 1) * 5 ) + (a - 10);
	}
	
	return noone;
}

function swapItem(s1, s2){
	
	var canSwap = true;
	if(!pc.slotUsable[s1]){ canSwap = false; }
	if(!pc.slotUsable[s2]){ canSwap = false; }
	if(!itemCanGoInSlot(s2, pc.bag[s1])){ canSwap = false; }
	if(!itemCanGoInSlot(s1, pc.bag[s2])){ canSwap = false; }
	
	
	if(canSwap){
		var temp = pc.bag[s1];
		pc.bag[s1] = pc.bag[s2];
		pc.bag[s2] = temp;
	}
}

function itemCanGoInSlot(slot, item){
	if(item == noone){ return true; }
	if(slot < 90){ return true; }
	if(!pc.slotUsable[slot]){ return false; }
	
	if(slot == 94 && item.slot == Slot.helm){ return true; }
	if(slot == 99 && item.slot == Slot.arm){ return true; }
	if(slot == 104 && item.slot == Slot.boot){ return true; }
	if(slot == 95 && item.slot == Slot.spec){ return true; }
	if(slot == 100 && item.slot == Slot.wep){ return true; }
	if(slot == 105 && item.slot == Slot.wep){ return true; }
	if( (slot == 91 || slot == 92 || slot == 93 || slot == 96 || slot == 97 || 
		slot == 98 || slot == 101 || slot == 102 || slot == 103)
		&& (item.slot == Slot.trink) ){ return true; }
	
	return false;
}

function selectNext(n){
	if(n == 0){ return; }
	n = sign(n);
	var start = pc.selected;
	do{
		pc.selected += n;
		if(pc.selected < 0){ pc.selected = 14; }
		if(pc.selected >14){ pc.selected = 0; }
	} until ( pc.bag[pc.selected] != noone || pc.selected == start);
}