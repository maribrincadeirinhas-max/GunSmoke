extends AudioStreamPlayer

func _ready():
	if stream and stream is AudioStreamWAV:
		stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
		stream.loop_end = stream.data.size()
	play()
