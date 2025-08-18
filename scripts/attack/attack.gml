function attack(c1, c2){
	
	
	
	
	
	var e = instance_create_depth(c2.xSpot*64+32, c2.ySpot*64, ww.layerEffect, effText);
	e.txt = "Hit";
	charBumpTowards(c2.xSpot, c2.ySpot);
	
	c2.justAttacked = true;

}