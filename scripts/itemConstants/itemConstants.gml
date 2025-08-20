enum Item {
	spellCallFire,
	rock,
}

function itemConstants(i){
	if(i == Item.rock){ return {
		ii: i, nam: "Junk",
		slot: noone,
		quantity: 1, stackable: true,
		useSpell: noone,
		costsMP: false, cost: 0,
		cd: 0, cdMax: 0,
		spellCharges: 0, breakChance: 100,
		throwSpell: Spell.throwObjectNoBreak,
		throughLos: true,
		pow: 2,
		img: imgItemRock,
		imgBG: noone,
	}}
	
	
	
	if(i == Item.spellCallFire){ return {
		ii: i, nam: "Call Fire",
		slot: noone,
		quantity: 1, stackable: false,
		useSpell: Spell.warmSelf,
		costsMP: true, cost: 4,
		cd: 0, cdMax: 0,
		spellCharges: 0, breakChance: 0,
		throwSpell: Spell.callFire,
		throughLos: false,
		pow: 1,
		img: imgFire,
		imgBG: noone,
	}}

}