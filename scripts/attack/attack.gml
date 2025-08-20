function attack(c1, c2){
	
	var hitBonus = c1.aim;
	var hitTarget = 100 - c2.evd;
	hitRollSuccessful = roll(hitTarget + hitBonus);
	
	var dam = c1.pow;
	if(c1.gear[Slot.wep] != noone){
		dam += irandom_range(1, c1.natWep); ///
		
	} else {
		dam += irandom_range(1, c1.natWep);
	}
	
	var atkEle = c1.natEle;
	
	
	
	if(hitRollSuccessful){
		damage(c2, dam, atkEle);
		
	} else {
		var e = instance_create_depth(c2.xSpot*64+32, c2.ySpot*64, ww.layerEffect, effText);
		e.txt = "Evd";
		e.txtCol = c2.aly ? c_aqua : c_grey;
	}
	
	if(c1.id != pc){ charBumpTowards(c2.xSpot, c2.ySpot); }
	c2.justAttacked = true;

}

function damage(c, dam, ele){
	if(c == noone){ return; }
	
	dam = clamp(dam + c.def[ele], 1, dam + c.def[ele]);
	c.hp -= dam;
	
	var e = instance_create_depth(c.xSpot*64+32, c.ySpot*64, ww.layerEffect, effText);
	e.txt = "" + string(dam);
	e.txtCol = c.aly ? c_red : c_white;
	
}