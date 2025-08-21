if(pc.xIn != 0 && pc.icd < 1){
	seed += pc.xIn;
	pc.icd = 6;
}

if(pc.yIn != 0 && pc.icd < 1){
	seed += pc.yIn * -10;
	pc.icd = 6;
}

if(seed < 1){ seed += 1000000; }
if(seed > 1000000){ seed -= 1000000; }

if(pc.keyIn == "R"){ seed = irandom_range(1, 1000000); }





if(pc.clickEnter){ 
	ww.seed = seed;
	ww.state = State.genDeep;
	instance_destroy();
}


if(pc.clickLM && pc.xMouseUI >= 5 && pc.xMouseUI < 10){
	if(pc.yMouseUI == 6){
		ww.seed = seed;
		pc.mode = Mode.arcade;
		ww.state = State.genDeep;
		instance_destroy();
	}
		
	if(pc.yMouseUI == 8){
		//pc.mode = Mode.story;
		//ww.state = State.genDeep; ///
		//instance_destroy();
	}
}


mouseOverText = "";
if(pc.xMouseUI >= 5 && pc.xMouseUI < 10){
	
	if(pc.yMouseUI == 6){
		mouseOverText = "Play a single run with permadeath. Gain upgrades between floors. Ideal for shorter play sessions and higher stakes gameplay. Seed can be chosen.";
	}
	
	if(pc.yMouseUI == 8){
		mouseOverText = "Play multiple runs unlocking upgrades on death. Includes a light story and a more RPG experience. Ideal for a longer and more casual or learning game.";
	}
}

