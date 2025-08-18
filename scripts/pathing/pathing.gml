function pathing(xStart, yStart, xEnd, yEnd){
	
	if(xStart == xEnd && yStart == yEnd){ return { a: xStart, b: yStart }; }
	
	xGo = -1; yGo = -1;

	///make array of all map locations set to unchecked
	for(var a=ww.xMin; a<ww.xMax; a++){
		for(var b=ww.yMin; b<ww.yMax; b++){
			mapStatus[a, b] = Path.unchecked;
		}	
	}

	///make array of all map location's parent cords set to -1
	for(var a=ww.xMin; a<ww.xMax; a++){
		for(var b=ww.yMin; b<ww.yMax; b++){
			xParent[a, b] = -1;
			yParent[a, b] = -1;
		}	
	}

	///make array of all map location's movement costs, can default to 0
	for(var a=ww.xMin; a<ww.xMax; a++){
		for(var b=ww.yMin; b<ww.yMax; b++){
			costReal[a, b] = 0;
			costGuess[a, b] = 0;
		}	
	}

	//target bounds checks
	while(xEnd < ww.xMin){ xEnd ++; }
	while(yEnd < ww.yMin){ yEnd ++; }
	while(xEnd >= ww.xMax){ xEnd --; }
	while(yEnd >= ww.yMax){ yEnd --; }

	if(xStart == xEnd && yStart == yEnd){ return noone; }
	
	xCursor = xStart;
	yCursor = yStart;
	mapStatus[xStart, yStart] = Path.open;


	status = Path.notDone;
	while(status == Path.notDone){
	
		pathingGetCursor();
	
		if(xCursor == -1){
			status = Path.noPath;
			break;
		}
	
		mapStatus[xCursor, yCursor] = Path.closed;
	
		if(xCursor == xEnd && yCursor == yEnd){
			status = Path.foundPath;
			break;
		}
	
		//look in all adjacent spaces
		for(var dir=1; dir<=4; dir++){
			if(dir == 1){ cx = xCursor; cy = yCursor - 1; }
			if(dir == 2){ cx = xCursor + 1; cy = yCursor; }
			if(dir == 3){ cx = xCursor; cy = yCursor + 1; }
			if(dir == 4){ cx = xCursor - 1; cy = yCursor; }
			if(dir == 5){ cx = xCursor - 1; cy = yCursor - 1; }
			if(dir == 6){ cx = xCursor - 1; cy = yCursor + 1; }
			if(dir == 7){ cx = xCursor + 1; cy = yCursor - 1; }
			if(dir == 8){ cx = xCursor + 1; cy = yCursor + 1; }
		
			//bounds check
			if(cx < ww.xMin || cy < ww.yMin || cx >= ww.xMax || cy >= ww.yMax){ continue; }
		
			//block check
			if(cx != xEnd || cy != yEnd){ // no block checks for target space
				if(!charCanEnter(cx, cy)){ continue; } // assumes called from char!
				//if(ww.bmap[cx, cy] != noone){ continue; }
			}
		
			//assign movement cost and parrent values
			if(mapStatus[cx, cy] == Path.unchecked || 
						costReal[cx, cy] > costReal[xCursor, yCursor] + 1) {
				mapStatus[cx, cy] = Path.open;
				costReal[cx, cy] = costReal[xCursor, yCursor] + 1;
				costGuess[cx, cy] = abs(cx - xEnd) + abs(cy - yEnd);
				xParent[cx, cy] = xCursor;
				yParent[cx, cy] = yCursor;
			}
		
		}
	
	
	}



	if(status == Path.foundPath){
		
		var xx = xEnd; var yy = yEnd;
	
		do {
	
			var xxx = xParent[xx, yy];
			var yyy = yParent[xx, yy];
	
			xx = xxx;
			yy = yyy;
			
			if(xx != xStart || yy != yStart){
				xGo = xx; yGo = yy;
			}
		
		} until (xx == xStart && yy == yStart)
		
	
		
		return { a: xGo, b: yGo };
		
	
	} else {
		//exit without giving a path
		return noone;
	}





}

enum Path {
	unchecked, open, closed, foundPath, noPath, notDone,
}


function pathingGetCursor(){
	
	xBest = -1;
	yBest = -1;

	for(var a=ww.xMin; a<ww.xMax; a++){
		for(var b=ww.yMin; b<ww.yMax; b++){
		
			if(mapStatus[a, b] == Path.open){
				if(xBest == -1 || costReal[a, b] + costGuess[a, b] < costReal[xBest, yBest] + costGuess[xBest, yBest]){
					xBest = a;
					yBest = b;
				}
			
			}
		
		}
	}

	xCursor = xBest;
	yCursor = yBest;

}