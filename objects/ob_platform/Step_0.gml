if (instance_exists(ob_player))
{
	if (round(ob_player.y + (ob_player.sprite_height/2)) > y)
		mask_index = -1
	else	
		mask_index = sp_platform
}	