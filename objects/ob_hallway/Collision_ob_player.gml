room_goto(targetRoom)
ob_player.x = targetDoor.x
ob_player.y = targetDoor.y - 50
if flip = 1
{
	with ob_player
		if image_xscale == 1
			image_xscale = -1
		else
			dewsximage_xscale = 1
}