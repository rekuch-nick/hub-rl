if(firstFrame){
	var angle = arctan2(yt - y, xt - x);
	xs = cos(angle) * moveSpeed;
	ys = sin(angle) * moveSpeed;
	dis = point_distance(x, y, xt, yt);
	if(pointAtTarget){
		image_angle = point_direction(x, y, xt, yt);
	}
}

x += xs;
y += ys;
dis -= abs(xs) + abs(ys);

pc.icd = max(pc.icd, 1);

if(dis <= 0){
	if(damageCall != noone){
		try{
			var c = damageCall.c;
			damage(c, damageCall.dam, damageCall.ele);
		} catch(e){ }
	}
	if(itemDrop != noone){
		spawnItem(itemDrop.i, itemDrop.a, itemDrop.b);
	}
	if(castOnLand){
		spellCastLate(castOnLand.spell, castOnLand.caster, castOnLand.a, castOnLand.b, castOnLand.throwing);
	}
	instance_destroy();
}
