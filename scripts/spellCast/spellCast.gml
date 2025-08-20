function spellCast(spell, caster, a, b){
	
	if(spell == Spell.callFire){
		instance_create_depth(a * 64, b * 64, ww.layerEffect, effFire);
		var dam = 10;
		damage(ww.mmap[a, b], dam, Ele.fire);
	}
	
	if(spell == Spell.throwObject or spell == Spell.throwObjectMaybeBreak or spell == Spell.throwObjectNoBreak){
		var t = instance_create_depth(caster.x, caster.y, ww.layerEffect, effThrowable);
		t.xt = a * 64; t.yt = b * 64;
		t.sprite_index = caster.throwing.img;
		t.damageCall = {
			c: ww.mmap[a, b],
			dam: caster.throwing.pow,
			ele: Ele.phys
		}
		if( (spell == Spell.throwObjectNoBreak) or 
			(spell == Spell.throwObjectMaybeBreak and roll(50)) ){
			t.itemDrop = {
				i: caster.throwing.ii,
				a: a, b: b,
			}
		}
		ww.state = State.ani;
	}

}