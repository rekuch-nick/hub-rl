state = State.title;
draw_set_font(fntPlain);

layerFloor = -200;
layerBlock = -2000;
layerMob = -4000;
layerScreen = -8000;
layerEffect = -8100;

instance_create_depth(0, 0, layerScreen, objScreenTitle);



