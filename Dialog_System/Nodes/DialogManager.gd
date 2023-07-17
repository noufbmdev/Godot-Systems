extends Control

enum Emotions { NORMAL, SHOCKED }

@export var dialog_box: Control
# The AudioStreamPlayer node used to play the sound.
@export var sound_player: AudioStreamPlayer
# The camera is used to shake when the speaker is shocked or excited.
@export var camera: Camera2D

# Default speed at which the text appears.
var text_speed : float = 0.1
# Stores each piece of dialog broken by a newline in the dialog_script.
var dialog_pieces: Array

func _ready():
	### TESTING ###
	#start_dialog("This is a test dialog. \n This is a new dialog.")
	#read_dialog("This is a test dialog. \n This is a new dialog.")
	### TESTING ###
	set_process(false)

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

## Function that starts the dialog, formats the string given to it, handles the
## tags inside the string, and displays it correctly on the screen.
## @param new_dialog: String, The script that will be displayed on the screen.
func start_dialog(dialog_script: String):
	# split dialog script by new lines
	var dialogs = dialog_script.split("\n")
	for i in range(dialogs.size()):
		# Remove leading and trailing whitespaces
		dialogs[i] = dialogs[i].strip_edges()
	
	# show each dialog piece one by one
	var shown_text = ""
	for dialog in dialogs:
		for letter in dialog:
			shown_text += letter
			# split dialog by each letter
			dialog_box.set_dialog_text(shown_text)
			await get_tree().create_timer(text_speed).timeout
			set_process(false)
		await dialog_box.next
		shown_text = ""
	
	set_process(true)

# Function to handle the emotion.
func handle_emotion(emotion: Emotions):
	if emotion == Emotions.SHOCKED:
		camera.get_node("Shake").start(1, 0.1, 5)  # Assuming that you have a CameraShake node named "Shake" as a child of your Camera2D node
