if(debugMode){
	image_alpha = random(1);
}



charDrawSelf();

if(selfAction == Action.takeExit){
	var c = choose(c_white, c_yellow);
	draw_set_halign(fa_center);
	draw_text_color(x + 32, y, "Enter", c, c, c, c, 1);
	draw_set_halign(fa_left);
}
//draw_text(x, y, string(fps));