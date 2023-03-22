extends Control

@onready var settings = SettingsManager.get_settings()
@onready var language_option_button = $Panel/VBoxContainer/ScrollContainer/VBoxContainer/General/Language/OptionButton

func _ready():
	# TODO: Update user interface
	# Load languages
	var locales = TranslationServer.get_loaded_locales()
	for locale in locales:
		language_option_button.add_item(locale)

func _on_reset_button_pressed():
	SettingsManager.set_settings(SettingsManager.DEFAULT)

func _on_apply_button_pressed():
	# TODO: Prepare settings
	var settings = {}
	# Save settings
	SettingsManager.set_settings(settings)
	# Apply settings in runtime
	SettingsManager.apply_settings(settings)
