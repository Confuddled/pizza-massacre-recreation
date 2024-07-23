if sprite_index == sp_pepshotgunequip
{	
	sprite_index = sp_pepshotgunidle
	state = "shotgun"
}
if sprite_index == sp_pepshotgun_unequip
{	
	sprite_index = sp_pepidle
	state = "normal"
}
if sprite_index == sp_pepshotgunshoot
{
	sprite_index = sp_pepshotgunidle
	state = "shotgun"
}
if sprite_index == sp_pepcrouchprep
{
	sprite_index = sp_pepcrouch
}
if sprite_index == sp_pepscreamdie
{
	sprite_index = blank
	
	alarm_set(2, 200)
	
}
