key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_down = keyboard_check(vk_down)
key_jump = keyboard_check_pressed(ord("Z"))
key_equipgun = keyboard_check_pressed(ord("A"))
key_shoot = keyboard_check_pressed(ord("V"))
key_up = keyboard_check_pressed(vk_up)
noclip_key_up = keyboard_check(vk_up)

var move = key_right -  key_left
if state == "normal" || state == "shotgun"
	xsp = move * movesp

if state != "noclip"
	ysp = ysp + grav



if place_meeting(x, y+1, ob_wall) && (key_jump) && state == "normal" 
{
	ysp = -15
	audio_play_sound(sn_jump, 5, false)
}
if place_meeting(x, y+1, ob_wall) && (key_jump) && state == "running" 
{
	ysp = -15
	audio_play_sound(sn_jump, 5, false)
}
if place_meeting(x+xsp, y, ob_wall) && state != "noclip"

{
	while (!place_meeting(x + sign(xsp), y, ob_wall))
	{
		x = x + sign(xsp)
	}
	xsp = 0;
}
x = x + xsp

if place_meeting(x, y+ysp, ob_wall) && state != "noclip"
{
	while (!place_meeting(x, y + sign(ysp), ob_wall))
	{
		y = y + sign(ysp)
	}
	ysp = 0;
	onFloor = 1
}
y = y + ysp

if place_meeting(x+xsp, y, ob_wall) && state == "running"
{
	while (!place_meeting(x + sign(xsp), y, ob_wall))
	{
		x = x + sign(xsp)
	}
	audio_play_sound(sn_bump, 5, false)
	if image_xscale == -1
	{	
		image_xscale = 1
		xsp = 8
	}
	else
	{	
	image_xscale = -1
	xsp = -8
	}	
	
}
if place_meeting(x, y, ob_gazesroom) && invis == 0
{
	global.hp -= 1
	invis = 1
	image_alpha = .5
	alarm_set(1, 50)
}
if global.hp == 0 || global.hp <= 0
{
	if state != "dead"
	{
		state = "dead"
	
		sprite_index = sp_pepscreamdie
		movesp = 0
		xsp = 0
	}
}
if key_equipgun && state != "screaming" && state != "running"
{
	if state == "shotgun"
	{
		state = "unequip shotgun"
		audio_play_sound(sn_shotgunload, 5, false)
		sprite_index = sp_pepshotgun_unequip
		xsp = 0
		movesp = 5
	}
	else
	{
		state = "equip shotgun"
		audio_play_sound(sn_shotgungot, 5, false)
		sprite_index = sp_pepshotgunequip
		xsp = 0
		movesp = 3
	}
}
if key_shoot && state == "shotgun"
{
	state = "shooting"
	audio_play_sound(sn_shotgunshot, 5, false)
	xsp = 0
	sprite_index = sp_pepshotgunshoot
	instance_create_layer(x, y, "Instances", ob_shotgunblast)
}

if key_down && state == "normal" && onFloor == 1 || key_down && state == "crouch" && onFloor == 1
{
	
	if state == "normal"
	{
		sprite_index = sp_pepcrouchprep
	}
	state = "crouch"
	xsp = 0
	mask_index = sp_playercrouchhitbox
	
}
if keyboard_check_released(vk_down) && state == "crouch"
{
	sprite_index = sp_pepcrouchgetup
	
	mask_index = sp_playerhitbox
	state = "normal"
	
}

if noclip_key_up && state == "noclip"
{
	y -= 10
}
if key_down && state == "noclip"
{
	y += 10
}
if key_left && state == "noclip"
{
	x -= 10
}
if key_right && state == "noclip"
{
	x += 10
}

//Animation
if (!place_meeting(x, y+1, ob_wall)) && state == "normal"
{
	onFloor = 0
	if sprite_index == sp_pepjumpprep1 || sp_pepidle || sp_pepwalk || sp_pepjumpprep2 	
		sprite_index = sp_pepjumpprep1
	
		

	if image_index >= 5 
		sprite_index = sp_pepjump1

}
else
{
	if (xsp == 0) && state == "normal" && global.hp >= 2
		sprite_index = sp_pepidle
	if (xsp !=0) && state == "normal"
		sprite_index = sp_pepwalk
	if (xsp == 0) && state == "shotgun"
		sprite_index = sp_pepshotgunidle
	if (xsp !=0) && state == "shotgun"
		sprite_index = sp_pepshotgunwalk
	if state == "running"
		sprite_index = sp_peprun
	if (xsp == 0) && global.hp = 1 && state == "normal"
		sprite_index = sp_peponehpidle
}
if (xsp != 0) image_xscale = sign(xsp)
	
	

