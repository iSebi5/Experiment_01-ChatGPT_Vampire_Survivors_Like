extends Label


# Called when the node enters the scene tree for the first time.
func _process(delta):
	var fps = Engine.get_frames_per_second()
	text = "FPS: "+str(fps)