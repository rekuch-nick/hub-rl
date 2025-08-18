draw_rectangle_color(4, 4, 4 + 64*4, 20, c_black, c_black, c_black, c_black, false);
var w = (pc.hp / pc.hpMax) * 64 * 4;
draw_rectangle_color(4, 4, 4 + w, 20, c_red, c_maroon, c_red, c_maroon, false);
var s = string(floor(pc.hp));
draw_text(10, 4, s);
