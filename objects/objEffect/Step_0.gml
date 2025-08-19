
x += xs;
y += ys;
ys += grav;

image_alpha -= fade;
maxAlpha -= fade;

if(flicker){
	image_alpha = random_range(0, maxAlpha);
}

timeCD --;

if(timeCD < 1){
	instance_destroy();
}