extends Control

@onready var settings = SettingsManager.get_settings()

func _ready():
	# Update user interface
	
	# Load languages
	pass

func _on_reset_button_pressed():
	SettingsManager.set_settings(SettingsManager.DEFAULT)

func _on_apply_button_pressed():
	# Prepare settings
	
	# Save settings
	# Apply settings in runtime
	pass
