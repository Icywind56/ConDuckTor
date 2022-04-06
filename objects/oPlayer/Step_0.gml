//Checking for Player Input
if(mouse_x>=x){
	image_yscale=1;
	//image_angle=point_direction(x,y,mouse_x,mouse_y);
}
else{
	image_yscale=-1;
	//image_angle=180-point_direction(x,mouse_y,mouse_x,y);
}
image_angle=point_direction(x,y,mouse_x,mouse_y);


if(keyboard_check(vk_right)){
	xAcc = baseAcc;
	//image_xscale=1;
}
else if(keyboard_check(vk_left)){
	xAcc = -baseAcc;
	//image_xscale=-1;
}
else{
	xAcc = 0;
}

if(keyboard_check_pressed(vk_up) && y==oCart.y+oCart.sprite_height-image_yscale*sprite_height/2){
	ySp = jumpSp;
}
if(keyboard_check_pressed(vk_space)){
	if(!instance_exists(oBow)){
		instance_create_layer(x,y,"IMain",oBow);
	}
	instance_create_layer(x,y,"IMain", oArrow);
}

//Constraining Speed
xSp = clamp((xSp + xAcc) * xDec,-mxSp,mxSp);
ySp = min(30,(ySp + grav));

//collisions
if (x+sprite_width/2+xSp>=oCart.x+oCart.sprite_width){
	xSp=0;
	x=oCart.x+oCart.sprite_width-sprite_width/2;
}
if (y+image_yscale*sprite_height/2+ySp>=oCart.y+oCart.sprite_height){
	y=oCart.y+oCart.sprite_height-image_yscale*sprite_height/2;
	ySp=0;
}


//Applying Speed to Position
x = clamp(x + xSp,sign(image_xscale)*sprite_width/2,room_width-sprite_width/2)
y = clamp(y + ySp,sprite_height/2,room_height-sprite_height/2)
