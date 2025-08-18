function scale(){
	image_xscale = 2; image_yscale = 2;
}

enum State { title, play, pause, flee, genHub, genDeep }

function inBounds(a, b){
	return a >= 0 && b >= 0 && a < 150 && b < 110;
}

function inBoundsMinMax(a, b){
	return a >= ww.xMin && b >= ww.yMin && a < ww.xMax && b < ww.yMax;
}