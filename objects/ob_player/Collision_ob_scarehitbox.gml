
with ob_scarehitbox
	instance_destroy()

state = "screaming"
audio_play_sound(sn_pepscream, 0, false)
sprite_index = sp_pepscream
xsp = 0
alarm_set(0, 150)