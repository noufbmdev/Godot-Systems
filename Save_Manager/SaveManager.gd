extends Node

@export var AUTOSAVE_ENABLED: bool = false
@export var AUTOSAVE_DURATION: int = 5 # Time between each autosave in seconds.
@export var MODE: int = 0 # 0: Single, 1: Multiple
@export var MAX_SAVE_NUMBER: int = 1
@export var SAVE_DIRECTORY: String = "user://Save/"

var save_data: Dictionary = {"name": "save"}

func _ready():
	# Create the save directory if it doesn't already exist
	if not DirAccess.open(SAVE_DIRECTORY):
		DirAccess.make_dir_absolute(SAVE_DIRECTORY)
	# Create autosave timer if autosave is enabled
	if AUTOSAVE_ENABLED:
		print("Autosave is enabled.")
		$Timer.connect("timeout", autosave)
		$Timer.start(AUTOSAVE_DURATION)

func get_file_path(save_name: String) -> String:
	return SAVE_DIRECTORY + save_name + ".dat"

# Load a save file's contents by its name
func set_save_data(file_name: String):
	save_data = read(file_name)
	if save_data.has("current_scene"):
		SceneManager.change_scene_to_file(save_data.current_scene.scene_path, "Fade")
	else:
		print("There is no scene in the save file.")
	
# Save the current save
func write():
	# Preparing save data
	save_data.current_scene = await SceneManager.save()
	# Record save data in a file
	var file = FileAccess.open(get_file_path(save_data.name), FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))

# Get the contents of a save file by its name
func read(file_name) -> Dictionary:
	var file = FileAccess.open(get_file_path(file_name), FileAccess.READ)
	return JSON.parse_string(file.get_as_text())

# Delete a file by its name
func delete(file_name):
	var dir = DirAccess.open(SAVE_DIRECTORY)
	return dir.remove(get_file_path(file_name))

# Get all save files in SAVE_DIRECTORY
func get_files() -> PackedStringArray:
	var dir = DirAccess.open(SAVE_DIRECTORY)
	return dir.get_files()

func autosave():
	if AUTOSAVE_ENABLED:
		print("Autosaved " + get_file_path(save_data.name) + " file.")
		write()
	else:
		print("Autosave is disabled.")
		$Timer.stop()
