extends Control

@onready var save_container = $HBoxContainer/SaveList/ScrollContainer/VBoxContainer
@onready var limit_mode = $HBoxContainer/Options/VBoxContainer/LimitMode
@onready var save_number = $HBoxContainer/Options/VBoxContainer/SaveNum
@onready var autosave_time = $HBoxContainer/Options/VBoxContainer/AutosaveTime
@onready var save_slot = $HBoxContainer/TempSaveSlot 

var extra_slot = 0

func _ready():
	_on_button_pressed()

func _on_mode_item_selected(index):
	SaveManager.MODE = index
	if index == 0:
		extra_slot = 0
		save_number.editable = false
		limit_mode.disabled = true
	else:
		limit_mode.disabled = false
		save_number.editable = true

func _on_limit_mode_item_selected(index):
	if index == 1:
		extra_slot = 1
		save_number.editable = false
	else:
		extra_slot = 0
		save_number.editable = true

func _on_autosave_toggled(button_pressed):
	SaveManager.AUTOSAVE_ENABLED = button_pressed
	if button_pressed:
		autosave_time.editable = true
	else:
		autosave_time.editable = false

func _on_button_pressed():
	# Setup autosave
	SaveManager.AUTOSAVE_DURATION = autosave_time.value
	SaveManager.autosave()
	
	# Clear all save slots
	for child in save_container.get_children():
		child.queue_free()
	
	# Add save slots
	SaveManager.MAX_SAVE_NUMBER = save_number.value + 1 + extra_slot
	for number in range(1, SaveManager.MAX_SAVE_NUMBER):
		var panel = save_slot.duplicate()
		panel.show()
		save_container.add_child(panel)
