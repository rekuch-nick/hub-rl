function spellCast(spell, caster, a, b){
	
	if(spell == Spell.callFire){
		instance_create_depth(a * 64, b * 64, ww.layerEffect, effFire);
		var dam = 10;
		damage(ww.mmap[a, b], dam, Ele.fire);
		if(roll(50)){ 
			if(charBuff(ww.mmap[a, b], Buff.burning, 1, 5)){
				messageSpawn(ww.mmap[a, b].nam + " catches fire", c_white);
			}
		}
	}
	
	if(spell == Spell.warmSelf){
		instance_create_depth(a * 64, b * 64, ww.layerEffect, effFire);
		caster.buff[Buff.frozen] = 0;
		caster.buff[Buff.cold] = 0;
		charBuff(caster, Buff.warm, 1, 1);
	}
	
	if(spell == Spell.createLightTorch){
		//instance_create_depth(a * 64, b * 64, ww.layerEffect, effFire);
		charBuff(caster, Buff.sightUPTorch, 1, 1);
		visionCheck();
	}
	
	if(spell == Spell.createLight){
		//instance_create_depth(a * 64, b * 64, ww.layerEffect, effFire);
		charBuff(caster, Buff.sightUP, 1, 1);
		visionCheck();
	}
	
	
	if(spell == Spell.throwObject or spell == Spell.throwObjectMaybeBreak or spell == Spell.throwObjectNoBreak or spell == Spell.throwBomb){
		var t = instance_create_depth(caster.x, caster.y, ww.layerEffect, effThrowable);
		t.xt = a * 64; t.yt = b * 64;
		t.sprite_index = caster.throwing.img2;
		if(caster.throwing.img != caster.throwing.img2){
			t.x += 32; t.y += 32;
			t.xt += 32; t.yt += 32;
			t.pointAtTarget = true;
		}
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
		if(spell == Spell.throwBomb ){
			t.damageCall = noone;
			t.castOnLand = {
				spell: Spell.blastArea, a: a, b: b,
				caster: caster, throwing: caster.throwing,
			}
		}
		ww.state = State.ani;
	}
	
	if(spell == Spell.throwFire){
		var t = instance_create_depth(caster.x, caster.y, ww.layerEffect, effThrowable);
		t.xt = a * 64; t.yt = b * 64;
		t.sprite_index = caster.throwing.img2;
		t.damageCall = {
			c: ww.mmap[a, b],
			dam: caster.throwing.pow,
			ele: Ele.fire
		}
		
		ww.state = State.ani;
	}
	
	if(spell == Spell.blastTile){
		instance_create_depth(a * 64, b * 64, ww.layerEffect, effBlast);
		var dam = caster.throwing.pow;
		damage(ww.mmap[a, b], dam, Ele.phys);
		charBuff(ww.mmap[a, b], Buff.stun, 1, 1);
		//if(ww.fmap[a, b].breakable){ ww.fmap[a, b].sprite_index = imgBlasted; }
		if(ww.bmap[a, b] != noone && ww.bmap[a, b].breakable){ removeBlock(a, b); }
	}
	
	if(spell == Spell.blastAroundSelf){
		spellCast(Spell.blastTile, caster, a-1, b-1); spellCast(Spell.blastTile, caster, a-1, b); spellCast(Spell.blastTile, caster, a-1, b+1); spellCast(Spell.blastTile, caster, a, b-1); spellCast(Spell.blastTile, caster, a, b+1); spellCast(Spell.blastTile, caster, a+1, b-1); spellCast(Spell.blastTile, caster, a+1, b); spellCast(Spell.blastTile, caster, a+1, b+1);
	}
	
	if(spell == Spell.blastArea){
		spellCast(Spell.blastTile, caster, a-1, b-1); spellCast(Spell.blastTile, caster, a-1, b); spellCast(Spell.blastTile, caster, a-1, b+1); spellCast(Spell.blastTile, caster, a, b-1); spellCast(Spell.blastTile, caster, a, b); spellCast(Spell.blastTile, caster, a, b+1); spellCast(Spell.blastTile, caster, a+1, b-1); spellCast(Spell.blastTile, caster, a+1, b); spellCast(Spell.blastTile, caster, a+1, b+1);
	}
	
	

}





function spellCastLate(spell, caster, a, b, throwing){
	caster.throwing = throwing;
	spellCast(spell, caster, a, b);
}