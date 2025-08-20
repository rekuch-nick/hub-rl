function input(){
	icd = clamp(icd - 1, 0, icd);
	
	
	if(debugPossible){
		if(keyboard_check_pressed(vk_f1)){ 
			debugMode = !debugMode; 
			slideSpeed = debugMode ? slideSpeedFast : slideSpeedBase;
			image_alpha = 1;
			visionCheck();
		}
	}
	
	
	xMouse = clamp(floor(mouse_x / 64), 0, 150 - 1);
	yMouse = clamp(floor(mouse_y / 64), 0, 110 - 1);
	xMouseUI = clamp(floor(device_mouse_x_to_gui(0) / 64), 0, 110 - 1);
	yMouseUI = clamp(floor(device_mouse_y_to_gui(0) / 64), 0, 150 - 1);
	
	mouseWheelIn = 0;
	if(mouse_wheel_up()){ mouseWheelIn --; }
	if(mouse_wheel_down()){ mouseWheelIn ++; }
	//show_debug_message(string(xMouseUI) + ", " + string(yMouseUI))
	
	
	xIn = 0;
	if(keyboard_check(ord("A")) || keyboard_check(vk_left)){ xIn --; }
	if(keyboard_check(ord("D")) || keyboard_check(vk_right)){ xIn ++; }
	if(xIn == 0){ xDirHeld = 0; } else { xDirHeld = clamp(xDirHeld + 1, 0, 600); }
	
	
	yIn = 0;
	if(keyboard_check(ord("W")) || keyboard_check(vk_up)){ yIn --; }
	if(keyboard_check(ord("S")) || keyboard_check(vk_down)){ yIn ++; }
	if(yIn == 0){ yDirHeld = 0; } else { yDirHeld = clamp(yDirHeld + 1, 0, 600); }
	
	
	clickEnter = keyboard_check_pressed(vk_enter);
	
	clickSpace = keyboard_check_pressed(vk_space);
	if(keyboard_check(vk_space)){
		holdSpaceTime = clamp(holdSpaceTime + 1, 0, 600);
	} else {
		holdSpaceTime = 0;
	}
	
	clickLM = mouse_check_button_pressed(mb_left);
	clickRM = mouse_check_button_pressed(mb_right);
	
	holdLM = mouse_check_button(mb_left);
	holdRM = mouse_check_button(mb_right);
	
	clickNO = keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("I"));
	
	keyIn = "";
	if(keyboard_check_pressed(192)){ keyIn = "`"; }
	if(keyboard_check_pressed(ord("1"))){ keyIn = "1"; }
	if(keyboard_check_pressed(ord("2"))){ keyIn = "2"; }
	if(keyboard_check_pressed(ord("3"))){ keyIn = "3"; }
	if(keyboard_check_pressed(ord("4"))){ keyIn = "4"; }
	if(keyboard_check_pressed(ord("5"))){ keyIn = "5"; }
	if(keyboard_check_pressed(ord("6"))){ keyIn = "6"; }
	if(keyboard_check_pressed(ord("7"))){ keyIn = "7"; }
	if(keyboard_check_pressed(ord("8"))){ keyIn = "8"; }
	if(keyboard_check_pressed(ord("9"))){ keyIn = "9"; }
	if(keyboard_check_pressed(ord("0"))){ keyIn = "0"; }
	
	if(keyboard_check_pressed(ord("Q"))){ keyIn = "Q"; }
	if(keyboard_check_pressed(ord("Z"))){ keyIn = "Z"; }
	

}