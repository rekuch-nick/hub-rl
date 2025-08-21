function buffRemove(c){
	for(var i=0; i<120; i++){
		c.buff[i] = 0;
	}
	if(c == pc){ buffPlayerUpdate(); }
}

function buffDecay(c){
	if(c.buff[Buff.frozen] > 0){ c.buff[Buff.frozen] --; }
	if(c.buff[Buff.stun] > 0){ c.buff[Buff.stun] --; }
	if(c.buff[Buff.burning] > 0){ damage(c, buff[Buff.burning], Ele.fire); }
	if(c == pc){ buffPlayerUpdate(); }
}

function buffPlayerUpdate(){
	
	with(objBuffIcon){ removeMe = true; }
	
	for(var i=0; i<120; i++){
		if(pc.buff[i] > 0){
			
			var buffIcon = findBuffIcon(i);
			if(buffIcon == noone){
				buffIcon = instance_create_depth(8 * 64, 0, ww.depth - 1, objBuffIcon);
				buffIconSetColors(buffIcon, i);
			}
			buffIcon.removeMe = false;
			buffIcon.stacks = pc.buff[i];
			buffIcon.image_index = clamp(buffIcon.stacks - 1, 0, 14);
		}
	}
	
	with(objBuffIcon){ if(removeMe){
		instance_destroy();
	}}
	
	var xMin = 64 * 8;
	var xMax = 64 * 13;
	with(objBuffIcon){
		while(collision_point(x, y, objBuffIcon, true, true)){ 
			x += 8; 
			if(x > xMax){
				x = xMin; y += 32;
			}
		}
	}
	
}

function findBuffIcon(i){
	with(objBuffIcon){
		if(buff == i){ return id; }
	}
	return noone;
}

function charBuff(c, b, n, m){
	if(c == noone){ return false; }
	c.buff[b] = clamp(c.buff[b] + n, 0, max(m, c.buff[b]) );
	if(c == pc){ buffPlayerUpdate(); }
	return true;
}

function buffIconSetColors(bi, bf){
	bi.txt = ".";
	bi.txtCol1 = c_grey;
	bi.txtCol2 = c_white;
	
	if(bf == Buff.warm){
		bi.txt = "W"; bi.txtCol1 = c_orange; bi.txtCol2 = c_red;
	}
	if(bf == Buff.sightUP){
		bi.txt = "L"; bi.txtCol1 = c_white; bi.txtCol2 = c_aqua;
	}
	if(bf == Buff.sightUPTorch){
		bi.txt = "L"; bi.txtCol1 = c_white; bi.txtCol2 = c_red;
	}
	
	if(bf == Buff.stun){
		bi.txt = "X"; bi.txtCol1 = c_purple; bi.txtCol2 = bi.txtCol1;
	}
	if(bf == Buff.burning){
		bi.txt = "F"; bi.txtCol1 = c_red; bi.txtCol2 = bi.txtCol1;
	}
}