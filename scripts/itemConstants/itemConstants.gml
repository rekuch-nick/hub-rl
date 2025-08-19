enum Item {
	potion, throwable, gear, wand,
	spellCallFire,
	rock,
}

function itemConstants(i){
	if(i == Item.rock){ return {
		nam: "Junk",
		slot: noone,
		quantity: 1, stackable: true,
		useSpell: noone,
		costsMP: false, cost: 0,
		useCD: true, cd: 0,
		spellCharges: 0, breakChance: 0,
		throwSpell: Spell.throwObject,
		throughLos: true,
		pow: 1,
		img: imgItemRock,
	}}
	
	
	
	if(i == Item.spellCallFire){ return {
		nam: "Call Fire",
		slot: noone,
		quantity: 1, stackable: false,
		useSpell: Spell.warmSelf,
		costsMP: true, cost: 4,
		useCD: true, cd: 0,
		spellCharges: 0, breakChance: 0,
		throwSpell: Spell.callFire,
		throughLos: true,
		pow: 1,
		img: imgFire,
	}}

}