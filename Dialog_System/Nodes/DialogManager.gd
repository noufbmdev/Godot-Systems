extends Control

enum Emotions { NORMAL, SHOCKED }
enum Character_Type {ALPHABET, NUMBER, PUNCTUATION, OTHER}

@export var dialog_box: Control
# The AudioStreamPlayer node used to play the sound.
@export var sound_player: AudioStreamPlayer
# The camera is used to shake when the speaker is shocked or excited.
@export var camera: Camera2D
# Default speed at which the text appears.
@export_range(0.1, 1) var text_speed : float = 0.1
# It will automatically go to the next piece of dialog once it is fully shown.
@export var auto_go_next: bool = true
# It will play a blip sound for each alphabetical letter.
@export var blip_enabled: bool = true
# It will toggle skipping dialogs.
@export var skip_enabled: bool = true
# It will toggle canceling dialogs.
@export var cancel_enabled: bool = true
# The input map action name for accepting.
@export var accept_action_name: String = "ui_accept"
# The input map action name for canceling.
@export var cancel_action_name: String = "ui_cancel"

# Stores each piece of dialog broken by a newline in the dialog_script.
var dialog_pieces: Array
var piece_index: int
var running: bool

func _ready():
	# Check if accept key or LMB is pressed to go to next dialog
	if skip_enabled: dialog_box.next.connect(next_dialog)
	# Check if cancel key or RMB is pressed to skip the whole dialog
	if cancel_enabled: dialog_box.cancel.connect(clear_dialog)
	start_dialog("The sound is annoying, I know. \n I'm not good at sounds.")

## Function that starts the dialog, formats the string given to it, handles the
## tags inside the string, and displays it correctly on the screen.
## @param new_dialog: String, The script that will be displayed on the screen.
func start_dialog(dialog_script: String):
	# setup the dialog for running
	dialog_pieces = dialog_script.split("\n")
	dialog_box.open()
	running = true
	
	var current_dialog = dialog_pieces[piece_index]
	var shown_dialog = ""
	# go over each dialog piece
	while piece_index < dialog_pieces.size() and running:
		current_dialog = dialog_pieces[piece_index]
		dialog_box.set_dialog_text(shown_dialog)
		# go over each letter in the dialog
		while current_dialog.length() > 0 and running:
			shown_dialog = dialog_box.get_dialog_text()
			dialog_box.set_dialog_text(shown_dialog + current_dialog[0])
			
			# Only play a sound if it is an alphabetic.
			if check_character_type(current_dialog[0]) == Character_Type.ALPHABET and blip_enabled:
				sound_player.play()
			
			current_dialog = current_dialog.substr(1, current_dialog.length())
			
			if Input.is_action_pressed(accept_action_name) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and skip_enabled:
				shown_dialog = ""
				break
				
			await get_tree().create_timer(text_speed).timeout
			
		if not auto_go_next:
			await dialog_box.next
			
		shown_dialog = ""
		next_dialog()
	
	# end the dialog
	clear_dialog()

func check_character_type(character: String) -> Character_Type:
	var alphabet_letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var numbers = "0123456789"
	var punctuation = ".,?!:;()-_'\""

	if alphabet_letters.find(character) >= 0:
		return Character_Type.ALPHABET
	elif numbers.find(character) >= 0:
		return Character_Type.NUMBER
	elif punctuation.find(character) >= 0:
		return Character_Type.PUNCTUATION
	else:
		return Character_Type.OTHER

## Function that reads a txt file and returns its contents.
## @param file_path: String, The path for the file that will be read.
## @return String, The contents of the file.
func read_file(file_path: String) -> String:
	var file = FileAccess.open(file_path, FileAccess.READ)
	var contents = ""
	if file == OK:
		contents = file.get_as_text()
		file.close()
	else:
		print("Failed to open file: ", file_path)
	return contents

## Function to clear the dialog and reset variables.
func clear_dialog():
	running = false
	dialog_pieces.clear()
	piece_index = 0
	dialog_box.close()

func next_dialog():
	print(piece_index)
	dialog_box.set_dialog_text("")
	piece_index += 1

## Function to handle the emotion.
func handle_emotion(emotion: Emotions):
	if emotion == Emotions.SHOCKED:
		pass
