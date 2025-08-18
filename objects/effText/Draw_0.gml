if(txt != noone){
	var w = string_width(txt) / 2;
	var h = string_height(txt);
	draw_rectangle_color(x-w, y, x+w, y+h, c_black, c_black, c_black, c_black, false);
	draw_set_halign(fa_center);
	draw_text_color(x, y, txt, txtCol, txtCol, txtCol, txtCol, image_alpha);
	draw_set_halign(fa_left);
}