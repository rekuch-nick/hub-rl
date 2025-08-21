if(ww.state != State.play){ return; }



if(!charInPlace()){
	slideToPlace();
}


if(hp < 1){
	messageSpawn(nam + " defeated", c_lime);
	ww.mmap[xSpot, ySpot] = noone;
	instance_destroy();
}