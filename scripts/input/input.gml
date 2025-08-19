function input(){
	icd = clamp(icd - 1, 0, icd);
	
	
	if(debugPossible){
		if(keyboard_check_pressed(vk_f1)){ 
			debugMode = !debugMode; 
			slideSpeed = 4 + (debugMode * 8); image_alpha = 1;
			visionCheck();
		}
	}
	
	
	xMouse = clamp(floor(mouse_x / 64), 0, 150 - 1);
	yMouse = clamp(floor(mouse_y / 64), 0, 110 - 1);
	yMouseUI = clamp(floor(device_mouse_y_to_gui(0) / 64), 0, 150 - 1);
	xMouseUI = clamp(floor(device_mouse_y_to_gui(0) / 64), 0, 110 - 1);
	
	
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
	
	clickNO = keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_escape);
	
	
	

}