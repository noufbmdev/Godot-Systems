extends Control

# TODO: add loading screen and audio mix?

# An instance of the scene manager needs to be globally accessible,
# In godot you can achieve that through autoload
func change_scene_to_file(target: String, transition: String):
	if $AnimationPlayer.has_animation(transition):
		await($AnimationPlayer.play(transition))
		get_tree().change_scene_to_file(target)
		await($AnimationPlayer.play_backwards(transition))
	else:
		get_tree().change_scene_to_file(target)
