function itemConstantsSpell(i, s){
	
	if(i == Item.spellCallFire){
		s.nam = "Call Fire";
		s.img = imgFire; s.img2 = s.img;
		s.stackable = false;
		s.useSpell = Spell.warmSelf;
		s.costsMP = true; s.cost = 4; s.breakChance = 0;
		s.throwSpell = Spell.callFire;
		s.throughLos = false;
		s.pow = 1;
	}
	
	
	return s;
}