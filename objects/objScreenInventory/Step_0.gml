



if(pc.clickNO || pc.clickEnter){
	ww.state = State.play;
	instance_destroy();
}



if(pc.clickRM){
	selected = noone;
}

if(pc.clickLM){
	var cords = inventoryCords(pc.xMouseUI, pc.yMouseUI);
	if(selected == noone){
		if(cords != noone && pc.slotUsable[cords]){
			xSelected = pc.xMouseUI;
			ySelected = pc.yMouseUI;
			selected = cords;
		}
	} else if(selected != cords){
		swapItem(selected, cords);
		selected = noone;
	}
	
}