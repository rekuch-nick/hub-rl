function playerClickTile(){
	
	if(clickRM){ ww.state = State.play; return; }
	
	if(clickLM){
		
		
		instance_create_depth(cur.x, cur.y, ww.layerEffect, effFire);
		
		
		
		
		
		ww.state = State.play; return;
	}
	
}