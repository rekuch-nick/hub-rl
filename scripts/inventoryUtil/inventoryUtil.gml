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
	
	var changingGear = s1 >= 91 or s2 >= 91;
	var wepException = s1 == 100 or s2 == 100 or s1 == 105 or s2 == 105;
	if(playerInCombat() && changingGear && !wepException){ 
		messageSpawn("Cannot change Equipment in combat", c_white);
		canSwap = false; 
	}
	
	if(canSwap){
		var temp = pc.bag[s1];
		pc.bag[s1] = pc.bag[s2];
		pc.bag[s2] = temp;
		
		if(changingGear){
			for(var i=0; i<15; i++){
				pc.gear[i] = pc.bag[91 + i];
			}
			
			
			
			calcGearStats(pc);
		}
		
	}
}

function wearItem(slot){
	var item = pc.bag[slot];
	if(item == noone){ return; }
	if(item.slot == Slot.helm){ swapItem(slot, 94); }
	else if(item.slot == Slot.arm){ swapItem(slot, 99); }
	else if(item.slot == Slot.boot){ swapItem(slot, 104); }
	else if(item.slot == Slot.wep){ swapItem(slot, 100); }
	else if(item.slot == Slot.spec){ swapItem(slot, 95); }
	else if(item.slot == Slot.trink){ swapItem(slot, 98); }
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


function calcGearStats(c){
	c.gearStats = {
			hp: 0, hpPerFloor: 0,
			mp: 0, mpPerFloor: 0,
			evd: 0, spellResis: 0,
			aim: 0, spot: 0, spellPierce: 0,
			pow: 0, powRange: 0, spellPow: 0,
			procChance: 0, ele: [],
			def: [0, 0, 0, 0, 0, 0, 0],
			perks: [],
		};
	
	for(var i=0; i<array_length(c.gear); i++){
		if(c.gear[i] == noone){ continue; }
		
		
		c.gearStats.hp += c.gear[i].stats.hp;
		c.gearStats.hpPerFloor += c.gear[i].stats.hpPerFloor;
		c.gearStats.mp += c.gear[i].stats.mp;
		c.gearStats.mpPerFloor += c.gear[i].stats.mpPerFloor;
		c.gearStats.evd += c.gear[i].stats.evd;
		c.gearStats.spellResis += c.gear[i].stats.spellResis;
		c.gearStats.aim += c.gear[i].stats.aim;
		c.gearStats.spot += c.gear[i].stats.spot;
		c.gearStats.spellPierce += c.gear[i].stats.spellPierce;
		c.gearStats.pow += c.gear[i].stats.pow;
		c.gearStats.powRange = max(c.gear[i].stats.powRange, c.gearStats.powRange);
		c.gearStats.spellPow += c.gear[i].stats.spellPow;
		c.gearStats.procChance += c.gear[i].stats.procChance;
		for(var j=0; j<7; j++){
			c.gearStats.def[j] += c.gear[i].stats.def[j];
		}
		for(var j=0; j<array_length(c.gear[i].stats.ele); j++){
			c.gearStats.ele[array_length(c.gearStats.ele)] = c.gear[i].stats.ele[j];
		}
		for(var j=0; j<array_length(c.gear[i].stats.perks); j++){
			c.gearStats.perks[array_length(c.gearStats.perks)] = c.gear[i].stats.perks[j];
		}
	}
}