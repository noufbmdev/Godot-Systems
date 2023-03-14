extends Timer

var SaveManager = preload("res://Save_System/SaveManager.tscn").instantiate()

func _ready():
	if SaveManager.AUTOSAVE:
		print("Autosave is enabled.")
		wait_time = SaveManager.AUTOSAVE_DURATION
		start()
	else:
		print("Autosave is disabled.")

func _on_timeout():
	print("Autosave " + SaveManager.get_save_file())
	SaveManager.write()
