extends Node

const PATH = "user://settings.txt"
const DEFAULT = {
	"audio": {
		"Master": {
			"volume": 0,
			"mute": 0,
		},
		"BGM": {
			"volume": 0,
			"mute": 0,
		},
		"SFX": {
			"volume": 0,
			"mute": 0,
		},
	},
	"window": {
		"resolution": "1024x768",
		"mode": 0,
	},
	"language": "en",
}

func _ready():
	# If there is no settings file, create one
	if not FileAccess.open(PATH, FileAccess.READ):
		print("New settings file created.")
		set_settings(DEFAULT)
	# On ready, set and apply settings
	var settings = get_settings()
	set_settings(settings)
	apply_settings(settings)

# Write and apply settings
func set_settings(settings: Dictionary):
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(settings))
	file.close()

# Read settings file
func get_settings() -> Dictionary:
	var file = FileAccess.open(PATH, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	return data

func apply_settings(settings: Dictionary):	
	if settings.has("audio"):
		for bus in settings.audio:
			AudioServer.set_bus_volume_db(0, settings.audio[bus].volume)
			AudioServer.set_bus_mute(0, settings.audio[bus].mute)
	
	if settings.has("window"):
		# TODO: Set window mode 0, 1, 2
		get_window().set_mode(settings.window.mode)
		# Set resolution and center window
		var window_size = settings.window.resolution.split("x")
		window_size = Vector2i(int(window_size[0]), int(window_size[1])) 
		get_window().set_size(window_size)
		get_window().set_position((DisplayServer.screen_get_size() - window_size)/2)
	
	# Apply language
	if settings.has("language"):
		TranslationServer.set_locale(settings.language)
