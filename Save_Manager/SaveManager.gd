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

# Returns a save file's path by its name.
func get_file_path(save_name: String) -> String:
	return SAVE_DIRECTORY + save_name + ".dat"

# Loads a save file's contents by its name into the game.
func set_save_data(save_name: String) -> void:
	save_data = read(save_name)
	if save_data.has("current_scene"):
		SceneManager.change_scene_to_file(save_data.current_scene.scene_path, "Fade")
	else:
		print("There is no scene in the save file.")
	
# Prepares data and saves it in the currently selected save file.
func write() -> void:
	# Preparing data
	save_data.current_scene = await SceneManager.save()
	# Record data in the file
	var file = FileAccess.open(get_file_path(save_data.name), FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))

# Returns the contents of a save file by its name as a Dictionary.
func read(save_name) -> Dictionary:
	var file = FileAccess.open(get_file_path(save_name), FileAccess.READ)
	return JSON.parse_string(file.get_as_text())

# Delete a file by its name.
func delete(save_name) -> void:
	var dir = DirAccess.open(SAVE_DIRECTORY)
	return dir.remove(get_file_path(save_name))

# Returns all save files in SAVE_DIRECTORY as a PackedStringArray.
func get_files() -> PackedStringArray:
	var dir = DirAccess.open(SAVE_DIRECTORY)
	return dir.get_files()

# Gets called everytime the autosave timer has timed out.
# Saves currently selected save file.
func autosave() -> void:
	if AUTOSAVE_ENABLED:
		print("Autosaved " + get_file_path(save_data.name) + " file.")
		write()
	else:
		print("Autosave is disabled.")
		$Timer.stop()
