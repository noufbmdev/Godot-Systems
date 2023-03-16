extends Control

func _ready():
	var transition_list = SceneManager.get_transition_list()
	for transition in transition_list:
		if not transition == "RESET":
			var button = Button.new()
			button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			button.size_flags_vertical = Control.SIZE_EXPAND_FILL
			button.text = transition
			button.connect("pressed", play.bind(transition))
			$GridContainer.add_child(button)

func play(transition):
	SceneManager.change_scene_to_file("res://Scene_Manager/Scene_Example.tscn", transition)
	Globals.start_scene_example_timer()
