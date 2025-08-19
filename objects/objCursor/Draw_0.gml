if(ww.state == State.play){
	draw_self();
} else if(ww.state == State.tileSelect || ww.state == State.tileSelectLos){
	
	
	for(var i=1; i<array_length(line) - 1; i++){
		draw_sprite_ext(imgCursorAim, image_index, line[i].a * 64, line[i].b * 64, 4, 4, image_angle, c_white, image_alpha);
	}
	
	draw_sprite_ext(imgCursorAim2, image_index, x, y, 4, 4, image_angle, c_white, image_alpha);
}