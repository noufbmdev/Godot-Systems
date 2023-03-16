### Features
> You need to **autoload** SceneManager.tscn for it to work.
- Open Scene_Example.tscn in Godot and test it out.
- Loading Screen
	- If your scene needs to close the curtains to load itself, you can enable loading in SceneManager.tscn by setting `LOADING_ENABLED` to true.
	- You can also select your loading screen by setting `LOADING_SCREEN` in SceneManager.tscn to an existing scene.
	- You must emit `loading_finished` signal in SceneManager.tscn to remove the loading screen.
- BGM Audio Fade
	- You can fade BGM in your game by setting `AUDIO_FADE_ENABLED` to true in SceneManager.tscn.
	- You can select BGM by setting `BACKGROUND_MUSIC` in SceneManager.tscn to an AudioStream.
- Transitions
	-`SceneManager.change_scene_to_file(SCENE_PATH, TRANSITION_NAME)`
	- The available transitions are:
		- Slide Up
		- Slide Right
		- Slide Down
		- Slide Left
		- Fade
