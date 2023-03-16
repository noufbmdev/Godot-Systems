extends Control

func _ready():
	for directory in DirAccess.open("res://").get_directories():
		for file in DirAccess.open(directory).get_files():
			if file.get_extension() == "tscn" and is_example(file):
				var button = Button.new()
				button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
				button.size_flags_vertical = Control.SIZE_EXPAND_FILL
				button.text = file.get_basename().split("_")[0]
				button.connect("pressed", go_to.bind(directory + "/" + file))
				$GridContainer.add_child(button)

func go_to(file):
	get_tree().change_scene_to_file(file)

func is_example(file):
	if len(file.get_basename().split("_")) > 1:
		if file.get_basename().split("_")[1] == "Example":
			return true
	return false
