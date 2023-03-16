extends Timer

@export var AUTOSAVE_ENABLED: bool = true
@export var AUTOSAVE_DURATION: int = 5 # Time between each autosave in seconds.

var SaveManager = preload("res://Save_System/SaveManager.tscn").instantiate()

func _ready():
	if AUTOSAVE_ENABLED:
		print("Autosave is enabled.")
		wait_time = AUTOSAVE_DURATION
		start()
	else:
		print("Autosave is disabled.")

func _on_timeout():
	print("Autosave " + SaveManager.get_save_file())
	SaveManager.write()
