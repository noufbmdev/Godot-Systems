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
}

func _ready():
	# On ready, apply settings
	var settings = await get_settings()
	apply_settings(settings)

# Write and apply settings
func set_settings(settings: Dictionary):
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(settings))
	file.close()
	
	# Apply settings
	apply_settings(settings)

# Read settings file
func get_settings() -> Dictionary:
	var data = {}
	var file = FileAccess.open(PATH, FileAccess.READ)
	# If there is no settings file, create one
	if not file:
		print("Settings file created.")
		await set_settings(DEFAULT)
	else:
		data = JSON.parse_string(file.get_as_text())
		file.close()
	return data

# TODO: setup bgm and sfx player
func apply_settings(settings: Dictionary):
	for audio in settings.audio:
		print(audio)
	#AudioServer.set_bus_volume_db(0, settings.audio.master.volume)
	#AudioServer.set_bus_mute(0, settings.audio.master.mute)
