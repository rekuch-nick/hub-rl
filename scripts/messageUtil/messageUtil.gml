function messageSpawn(s, c){
	var m = instance_create_depth(0, 64 * 9 + 40, ww.layerEffect - 10, objMessage); 
	m.txt = s;
	m.txtCol = c;
}