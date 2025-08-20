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
slideSpeedFast = 16;
slideSpeedBase = 8;



xSpot = 75;
ySpot = 55;
xLast = xSpot; yLast = ySpot;
throwing = noone


hp = 100;
hpMax = 100;
mp = 20;
mpMax = 20;

hpPerFloor = 20;
mpPerFloor = 20;

evd = 10;


for(var i=0; i<120; i++){
	bag[i] = noone;
	slotUsable[i] = i < 90;
}


bag[0] = itemConstants(Item.spellCallFire);
//bag[1] = itemConstants(Item.rock); bag[1].quantity = 99;
selected = 0;
slotHelm = 94; 
slotArmor = 99;
slotBoot = 104;
slotWep = 100;
slotWep2 = 105;
slotSpec = 95;
slotTrink = [91, 92, 93, 96, 97, 98, 101, 102, 103];
slotUsable[slotHelm] = true;
slotUsable[slotArmor] = true;
slotUsable[slotBoot] = true;
slotUsable[slotWep] = true;
slotUsable[98] = true;
slotUsable[103] = true;

selfAction = noone;

timeShouldPass = 0;

enteredTile = false;
charSetLocationBySpot();

moveDiag = false;
attackDiag = true;
