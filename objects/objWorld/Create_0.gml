state = State.title;
draw_set_font(fntPlain);
game_set_speed(30, gamespeed_fps);

seed = 1;
layerFloor = -200;
layerBlock = -2000;
layerPup = -3000;
layerMob = -4000;
layerScreen = -8000;
layerEffect = -8100;

instance_create_depth(0, 0, layerScreen, objScreenTitle);


