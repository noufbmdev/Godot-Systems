extends Control

signal loading_finished

@export var LOADING_SCREEN = preload("res://Scene_Manager/LoadingScreen.tscn")
@export var LOADING_ENABLED: bool = true
@export var BACKGROUND_MUSIC: AudioStream = AudioStream.new()
@export var AUDIO_FADE_ENABLED: bool = true

func _ready():
	LOADING_SCREEN = LOADING_SCREEN.instantiate()

# An instance of the scene manager needs to be globally accessible,
# In godot you can achieve that through autoload
func change_scene_to_file(target: String, transition: String):
	# Only animate if the transition exists, otherwise just change scenes
	if $AnimationPlayer.has_animation(transition):
		# Fade audio
		if AUDIO_FADE_ENABLED:
			$AudioPlayer.play("Fade_Out")
		# Play enter transition animation
		$AnimationPlayer.play(transition)
		await $AnimationPlayer.animation_finished
		
		# Change scene and wait for loading to finish
		get_tree().change_scene_to_file(target)
		if LOADING_ENABLED:
			get_tree().paused = true
			# Show loading screen
			add_child(LOADING_SCREEN)
			await loading_finished
			# Remove loading screen
			remove_child(LOADING_SCREEN)
			get_tree().paused = false
		
		# Fade audio
		if AUDIO_FADE_ENABLED:
			$AudioPlayer.play("Fade_In")
		# Play exit transition animation
		$AnimationPlayer.play_backwards(transition)
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play("RESET")
	else:
		get_tree().change_scene_to_file(target)

# Returns a list of transition animations
func get_transition_list() -> Array:
	return $AnimationPlayer.get_animation_list()

func save():
	var data = {
		"scene_path": null,
		"screenshot_path": null
	}
	
	# Save a screenshot of the current scene
	await RenderingServer.frame_post_draw
	var screenshot_path = SaveManager.SAVE_DIRECTORY + SaveManager.save_data.name + ".png"
	var result = get_viewport().get_texture().get_image().save_png(screenshot_path)
	if result == OK:
		data.screenshot_path = screenshot_path
	else:
		print("Error while saving screenshot.")
	
	# Pack and save current scene
	var packed_scene = PackedScene.new()
	result = packed_scene.pack(get_tree().get_current_scene())
	if result == OK:
		var scene_path = SaveManager.SAVE_DIRECTORY + SaveManager.save_data.name + ".tscn"
		result = ResourceSaver.save(packed_scene, scene_path)
		if result == OK:
			data.scene_path = scene_path
		else:
			print("Error while saving current scene as a resource.")
	else:
		print("Error while packing current scene.")
	
	return data
