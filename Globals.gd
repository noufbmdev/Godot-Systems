extends Node

@export var BGM_MAX_VOL: int = 0

func start_scene_example_timer():
	var timer = Timer.new()
	timer.one_shot = true
	add_child(timer)
	timer.start(5)
	await timer.timeout
	SceneManager.emit_signal("loading_finished")
	timer.queue_free()
