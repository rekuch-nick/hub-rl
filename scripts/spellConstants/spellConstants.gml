enum Spell {
	throwObject, throwObjectNoBreak, throwObjectMaybeBreak,
	callFire, warmSelf,
}


function spellGet(s){
	if(s == Spell.callFire){ return {
		nam: "Call Fire",
		cost: 4,
		cd: 4,
		ele: Ele.fire,
		tar: Target.cur,
		losReq: true,
	}}
}