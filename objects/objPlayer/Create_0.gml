xMouseLast = mouse_x;
yMouseLast = mouse_y;
debugPossible = true;
debugMode = false;
depth = ww.layerMob - 999;
deep = 0;
aly = 1;

icd = 0;
xDirHeld = 0; yDirHeld = 0;
holdSpaceTime = 0;
input();
charInitStats();

facing = 1;
slideSpeed = 8;



xSpot = 75;
ySpot = 55;
xLast = xSpot; yLast = ySpot;



hp = 100;
hpMax = 100;
mp = 20;
mpMax = 20;

hpPerFloor = 20;
mpPerFloor = 20;

evd = 10;


for(var i=0; i<100; i++){
	bag[i] = noone;
}
bag[0] = itemConstants(Item.spellCallFire);
bag[1] = itemConstants(Item.rock); bag[1].quantity = 99;



timeShouldPass = 0;

enteredTile = false;
charSetLocationBySpot();


