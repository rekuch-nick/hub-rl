function worldGenMazeFrom(cx, cy){
	
	
	bmap[cx, cy] = noone;
	
	d[1] = false; d[2] = false; d[3] = false; d[4] = false;
	
	xLast[0] = cx;
	yLast[0] = cy;
	last = 0;
	
	var tx = cx; var ty = cy; var ttx = cx; var tty = cy;
	
	while(last >= 0){
		
		if(d[1] && d[2] && d[3] && d[4]){
			if(last >= 0){
				
				
				cx = xLast[last]
				cy = yLast[last]
				d[1] = false; d[2] = false; d[3] = false; d[4] = false;
				last --;
			} else {
				break;
			}
		}
		
		do {
			var r = irandom_range(1, 4);
		} until (!d[r]);
		tx = cx; ty = cy; 
		ttx = cx; tty = cy;
		if(r == 1){ tty = cy - 1; ty = cy - 2; }
		if(r == 2){ ttx = cx + 1; tx = cx + 2; }
		if(r == 3){ tty = cy + 1; ty = cy + 2; }
		if(r == 4){ ttx = cx - 1; tx = cx - 2; }
		d[r] = true;
		
		if(inBoundsMinMax(tx, ty)){
			if(bmap[tx, ty] == imgBlock){
				bmap[tx, ty] = noone;
				bmap[ttx, tty] = noone;
				
				last ++;
				xLast[last] = tx; yLast[last] = ty; 
				
				cx = tx; cy = ty;
				d[1] = false; d[2] = false; d[3] = false; d[4] = false;
			}
		}
		
	}

}






function worldGenReplaceBlockRandom(oldBlock, newBlock){
	var tries = 0;
	while(tries < 1000){
		tries ++;
		
		var a = irandom_range(xMin, xMax - 1);
		var b = irandom_range(yMin, yMax - 1);
		
		if(bmap[a, b] != oldBlock){ continue; }
		
		bmap[a, b] = newBlock;
		return;
	}
}

function worldGenReplaceBlockRandomOnWall(oldBlock, newBlock){
	var tries = 0;
	while(tries < 1000){
		tries ++;
		
		var a = irandom_range(xMin, xMax - 1);
		var b = irandom_range(yMin, yMax - 1);
		
		if(bmap[a, b] != oldBlock){ continue; }
		var d1 = !inBounds(a, b - 1) || bmap[a, b - 1] == oldBlock;
		var d2 = !inBounds(a + 1, b) || bmap[a + 1, b] == oldBlock;
		var d3 = !inBounds(a, b + 1) || bmap[a, b + 1] == oldBlock;
		var d4 = !inBounds(a - 1, b) || bmap[a - 1, b] == oldBlock;
		if(!(d1 && d3 && !d2 && !d4) && !(d2 && d4 && !d1 && !d3) ){ continue; }
		
		bmap[a, b] = newBlock;
		return;
	}
}

function worldGenReplaceFloorEmpty(oldFloor, newFloor){
	var tries = 0;
	while(tries < 1000){
		tries ++;
		
		var a = irandom_range(xMin, xMax - 1);
		var b = irandom_range(yMin, yMax - 1);
		
		if(bmap[a, b] != noone){ continue; }
		if(fmap[a, b] != oldFloor){ continue; }
		if(a == pc.xSpot && b == pc.ySpot){ continue; }
		
		fmap[a, b] = newFloor;
		return true;
	}
	return false;
}



function worldGenReplaceFloorCornerEmpty(oldFloor, newFloor){
	var tries = 0;
	while(tries < 1000){
		tries ++;
		
		var w = ((xMax - xMin) / 10);
		var h = ((yMax - yMin) / 10);
		
		var a = irandom_range(0, w);
		a = choose(xMax - w, xMin + w);
		
		var b = irandom_range(0, h);
		b = choose(yMax - h, yMin + h);
		
		if(bmap[a, b] != noone){ continue; }
		if(fmap[a, b] != oldFloor){ continue; }
		if(disManhat(a, b, pc.xSpot, pc.ySpot)){ continue; }
		
		fmap[a, b] = newFloor;
		return true;
	}
	return false;
}





