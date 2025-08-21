function itemConstantsGear(i, s){
	s.stackable = false;
	
	if(i == Item.sword){
		s.nam = "Sword";
		s.img = imgItemSword; s.img2 = s.img;
		s.slot = Slot.wep;	
		s.stats.powRange = 6;
		s.stats.pow = 1;
	}
	
	if(s.nam != "-"){ return s; }
	return itemConstantsSpell(i, s);
	
}