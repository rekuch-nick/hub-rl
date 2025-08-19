image_xscale = 4;
image_yscale = 4;
facing = 1;
charInitStats();

hp = 6;
hpMax = 6;
aly = -1;
evd = 10;
aim = 0;
huntChance = 70;

xSpot = floor(x / 64);
ySpot = floor(y / 64);
charSetLocationBySpot();
xLast = xSpot; yLast = ySpot;

slideSpeed = 8;
justAttacked = false;


