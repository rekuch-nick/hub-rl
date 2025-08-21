function attack(c1, c2){
	
	var hitBonus = (c1.aim + c1.gearStats.aim);
	var hitTarget = 100 - (c2.evd + c2.gearStats.evd);
	hitRollSuccessful = roll(hitTarget + hitBonus);
	
	var dam = c1.pow + c1.gearStats.pow;
	
	var damDice = max(c1.natWep, c1.gearStats.powRange);
	dam += irandom_range(1, damDice);
		
	
	
	var atkEle = c1.natEle; /// should choose form all c1's elements and use weakest c2.def
	
	
	
	if(hitRollSuccessful){
		//messageSpawn(c1.nam + " hit " + c2.nam + " for " + string(dam), c_grey);
		damage(c2, dam, atkEle);
		
	} else {
		//messageSpawn(c2.nam + " dodged " + c1.nam, c_grey);
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