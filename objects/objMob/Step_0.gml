if(ww.state != State.play){ return; }



if(!charInPlace()){
	slideToPlace();
}


if(hp < 1){
	ww.mmap[xSpot, ySpot] = noone;
	instance_destroy();
}