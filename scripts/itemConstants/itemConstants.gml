enum Item {
	spellCallFire,
	rock, dart, torch, bomb, key,
	sword,
}

function itemConstants(i){
	var s = {
		ii: i, nam: "-",
		slot: noone,
		quantity: 1, stackable: true,
		useSpell: noone,
		costsMP: false, cost: 0,
		cd: 0, cdMax: 0,
		spellCharges: 0, breakChance: 100,
		throwSpell: noone,
		throughLos: true, throwRange: -1, pow: 1,
		img: imgBlank, img2: imgBlank, imgBG: noone,
		stats: {
			hp: 0, hpPerFloor: 0,
			mp: 0, mpPerFloor: 0,
			evd: 0, spellResis: 0,
			aim: 0, spot: 0, spellPierce: 0,
			pow: 0, powRange: 0, spellPow: 0,
			procChance: 0, ele: noone,
			def: [0, 0, 0, 0, 0, 0, 0], perks: [],
		},
	};
	
	if(i == Item.rock){ 
		s.nam = "Rock";
		s.img = imgItemRock; s.img2 = s.img;
		s.throwSpell = Spell.throwObjectNoBreak;
		s.pow = 2;
	}
	
	if(i == Item.dart){
		s.nam = "Dart";
		s.img = imgItemDart; s.img2 = imgEffDart;
		s.throwSpell = Spell.throwObject;
		s.pow = 5; s.quantity = 10;
	}
		
	if(i == Item.torch){
		s.nam = "Torch";
		s.img = imgItemTorch; s.img2 = s.img;
		s.useSpell = Spell.createLightTorch;
		s.throwSpell = Spell.throwFire;
		s.pow = 5; s.quantity = 2;
	}	
		
	if(i == Item.bomb){
		s.nam = "Bomb";
		s.img = imgItemBomb; s.img2 = s.img;
		s.useSpell = Spell.blastAroundSelf;
		s.throwSpell = Spell.throwBomb; s.throwRange = 3;
		s.pow = 5;
	}
	
	if(i == Item.key){
		s.nam = "Key";
		s.img = imgItemKey; s.img2 = s.img;
	}
		
		
		
	
	
	
	
	
	
	if(s.nam != "-"){ return s; }
	return itemConstantsGear(i, s);
}