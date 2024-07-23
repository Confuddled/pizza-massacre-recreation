state = "running"
audio_pause_all()
audio_play_sound(sn_runaway, 1, true)
sprite_index = sp_peprun
if image_xscale == -1
{	
	image_xscale = 1
	xsp = 8
}
else
{	image_xscale = -1
	xsp = -8
}	