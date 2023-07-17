class_name DialogBox extends Control

signal next
signal cancel

# Required Nodes:
@export var dialog_text: RichTextLabel
# Optional Nodes:
@export var speaker_name: Label
@export var speaker_portrait: TextureRect
@export var next_prompt: TextureRect
@export var next_action: String = "ui_accept"
@export var cancel_action: String = "ui_cancel"

func _ready():
	#animate_next_prompt()
	pass

func _input(event):
	# Keyboard Events
	if event.is_action_released(next_action):
		next.emit()
	if event.is_action_released(cancel_action):
		cancel.emit()
	# Mouse Events
	if event is InputEventMouseButton and not event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				next.emit()
			MOUSE_BUTTON_RIGHT:
				cancel.emit()

func set_dialog_text(text: String):
	dialog_text.set_text(text)

func get_dialog_text() -> String:
	return dialog_text.get_text()

func get_dialog_text_node() -> RichTextLabel:
	return dialog_text

func set_speaker_name(text: String):
	speaker_name.set_text(text)

func get_speaker_name_node() -> Label:
	return speaker_name

func set_speaker_portrait(texture: Texture2D):
	speaker_portrait.set_texture(texture)

func get_speaker_portrait_node() -> TextureRect:
	return speaker_portrait

func animate_next_prompt():
	var tween = create_tween().set_loops()
	var next_prompt_position_y = next_prompt.position.y
	tween.tween_property(next_prompt, "position:y", next_prompt_position_y - 2, 0.5).from_current()
	tween.chain().tween_property(next_prompt, "position:y", next_prompt_position_y + 2, 0.5).from_current()

func open():
	visible = true
	# You can add animations here.

func close():
	visible = false
	set_dialog_text("")
	# You can add animations here.
