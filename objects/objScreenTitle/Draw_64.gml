draw_self();

draw_sprite_stretched(imgButtonStart, 0, 5 * 64, 6 * 64, 5 * 64, 64);


draw_sprite_stretched(imgButtonStart, 0, 5 * 64, 8 * 64, 5 * 64, 64);

draw_set_color(c_yellow);
draw_set_halign(fa_center);

draw_text(480, 6 * 64 + 24, "Rogue-Like");
draw_text(480, 8 * 64 + 24, "Campaign");




draw_set_color(c_white);
draw_set_halign(fa_center);