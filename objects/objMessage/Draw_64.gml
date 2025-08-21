if(txt != noone){
	var w = string_width(txt);
	var h = string_height(txt);
	draw_set_alpha(image_alpha);
	draw_rectangle_color(x, y, x+w, y+h, c_black, c_black, c_black, c_black, false);
	draw_text_color(x, y, txt, txtCol, txtCol, txtCol, txtCol, image_alpha);
	draw_set_alpha(1);
}