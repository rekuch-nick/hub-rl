function playerItemUse(slot, useOnSelf){
	
	if(!charCanAttack()){ return; } /// allow warm while frozen, etc!
	
	var item = pc.bag[slot];
	if(item == noone){ return; }
	
	if(useOnSelf && item.slot != noone){
		wearItem(slot);
		return;
	}
	
	if(useOnSelf && item.useSpell == noone){ return; }
	if(!useOnSelf && item.throwSpell == noone){ return; }
	
	if(item.costsMP && pc.mp < item.cost){ return; }
	if(item.cdMax > 0 && item.cd > 0){ return; }
	
	if(!useOnSelf){
		if(item.throwSpell != noone){
			
			
			pc.throwing = slot; // needed ever ???
			pc.throwing = item;
			ww.state = State.tileSelectLos;
			if(!item.throughLos){ ww.state = State.tileSelect; }
		}
	} else {
		if(item.useSpell == noone){ return; }
		if(item.costsMP){ pc.mp = clamp(pc.mp - item.cost, 0, pc.mp); }
		if(item.cd > 0){ item.cd = item.cdMax; }
		
		pc.throwing = item;
		spellCast(item.useSpell, id, xSpot, ySpot);
		
		if(roll(item.breakChance)){ 
			playerConsumeItem(item);
		}
	
		pc.timeShouldPass += 1;
		pc.throwing = noone;
		pc.icd = 10;
		
	}
	
}

function playerItemUseThrown(item, a, b){
	//var item = pc.bag[slot];
	if(item == noone){ return; }
	
	if(item.costsMP){ pc.mp = clamp(pc.mp - item.cost, 0, pc.mp); }
	if(item.cd > 0){ item.cd = item.cdMax; }
	
	
	
	ww.state = State.play;
	pc.throwing = item;
	spellCast(item.throwSpell, id, a, b);
	
	
	if(roll(item.breakChance)){ 
		playerConsumeItem(item);
	}
	
	pc.timeShouldPass += 1;
	pc.throwing = noone;
	pc.icd = 10;
	
}