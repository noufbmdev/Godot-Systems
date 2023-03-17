extends Node

@export var AUTOSAVE_ENABLED: bool = false
@export var AUTOSAVE_DURATION: int = 5 # Time between each autosave in seconds.
@export var MODE: int = 0 # 0: Single, 1: Multiple
@export var MAX_SAVE_NUMBER: int = 1
@export var SAVE_DIRECTORY: String = "user://Save/"

var save_file: String = "save.dat" # Stores the name of the save file with its extension.
var save_data: Dictionary = {"key": "value"}

func _ready():
	if not DirAccess.open(SAVE_DIRECTORY):
		DirAccess.make_dir_absolute(SAVE_DIRECTORY)
	autosave()

func set_save_file(file_name_with_extension: String):
	save_file = file_name_with_extension

func get_save_file() -> String:
	return save_file

func write():
	var file = FileAccess.open(SAVE_DIRECTORY + save_file, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))

func read() -> String:
	var file = FileAccess.open(SAVE_DIRECTORY + save_file, FileAccess.READ)
	return file.get_as_text()

func delete():
	var dir = DirAccess.open(SAVE_DIRECTORY)
	return dir.remove(SAVE_DIRECTORY + save_file)

func get_files() -> PackedStringArray:
	var dir = DirAccess.open(SAVE_DIRECTORY)
	return dir.get_files()

func autosave():
	if AUTOSAVE_ENABLED:
		print("Autosave is enabled.")
		$Timer.start(AUTOSAVE_DURATION)
	else:
		print("Autosave is disabled.")
		$Timer.stop()

func _on_timer_timeout():
	print("Autosave " + SaveManager.get_save_file())
	SaveManager.write()
