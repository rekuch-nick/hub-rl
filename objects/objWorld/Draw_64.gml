draw_rectangle_color(0, 0, 64*15, 63, c_black, c_black, c_navy, c_navy, false);
draw_rectangle_color(0, 64*10, 64*15, 64*10+63, c_navy, c_navy, c_black, c_black, false);



draw_rectangle_color(4, 4, 4 + 64*4, 28, c_black, c_black, c_black, c_black, false);
var w = (pc.hp / pc.hpMax) * 64 * 4;
draw_rectangle_color(4, 4, 4 + w, 28, c_red, c_red, c_maroon, c_maroon, false);
var s = string(floor(pc.hp));
draw_text(10, 8, s);


draw_rectangle_color(4, 36, 4 + 64*4, 60, c_black, c_black, c_black, c_black, false);
var w = (pc.mp / pc.mpMax) * 64 * 4;
draw_rectangle_color(4, 36, 4 + w, 60, c_aqua, c_aqua, c_blue, c_blue, false);
var s = string(floor(pc.mp));
draw_text(10, 40, s);


var b = 10 * 64;
for(var i=0; i<10; i++){
	draw_sprite_stretched(imgCursor, 0, i * 64, b, 64, 64);
}