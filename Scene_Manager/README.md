## Notes
You need to **autoload** SceneManager.tscn for it to work.

Open **Scene_Example.tscn** in Godot and test it out.

## Options

```SceneManager.change_scene_to_file(SCENE_PATH, TRANSITION_NAME)```
- Changes between scenes with transitioning.
- The available transitions are:
	- Slide Up
	- Slide Right
	- Slide Down
	- Slide Left
	- Fade

### Loading Screen
```var LOADING_SCREEN = preload("res://Scene_Manager/LoadingScreen.tscn")```
- Select loading screen, it must be an existing tscn file.

> You must emit `loading_finished` signal in SceneManager.tscn to remove the loading screen.

```var LOADING_ENABLED: bool = true```
- Enable loading screen.

### Background Music Fade
```var BACKGROUND_MUSIC: AudioStream = AudioStream.new()```
- Set background music.

```var AUDIO_FADE_ENABLED: bool = true```
- Enable fading of background music between scenes.

### Camera Zoom [INCOMPLETE]
### Notifications [INCOMPLETE]
