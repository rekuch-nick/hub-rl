draw_self();

draw_sprite_stretched(imgButtonStart, 0, 5 * 64, 6 * 64, 5 * 64, 64);


draw_sprite_stretched(imgButtonStart, 0, 5 * 64, 8 * 64, 5 * 64, 64);

draw_set_color(c_yellow);
draw_set_halign(fa_center);

draw_text(480, 6 * 64 + 24, "Rogue Like");
draw_text(480, 8 * 64 + 24, "Story Mode");



draw_set_color(c_white);
draw_set_halign(fa_left);

if(mouseOverText != ""){
	draw_rectangle_color(64, 64, 14 * 64, 4 * 64, c_black, c_black, c_black, c_black, false);
	draw_text_ext(96, 96, mouseOverText, 32, 864 - 96);
}


draw_text_color(660, 6 * 64 + 24, "< Seed: " + string(seed) + " >\n(R->random)", c_grey, c_grey, c_grey, c_grey, 1);