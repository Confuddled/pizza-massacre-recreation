if state == "running"
{
	state = "normal"
	audio_stop_sound(sn_runaway)
	audio_resume_all()
}
