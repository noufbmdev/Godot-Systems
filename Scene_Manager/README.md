# 🎬 Scene Manager

> ℹ️ Try it out!
> Open and run **Scene_Example.tscn** in Godot engine.

## Features
- Scene Transitions
	- BGM Audio Fade
- Loading Screen
- Pause Screen
- Camera Zoom
- Scene Teleport

## Setup
An instance of the scene manager needs to be globally accessible, in godot you can achieve that
through autoload.
1. Autoload SceneManager.tscn: Project > Project Settings > Autoload
2. Call functions on SceneManager: ```SceneManager.function()```

## Documentation
### Nodes

### Options
- `LOADING_ENABLED` : bool - Enable loading screen.
- `LOADING_SCREEN`: PackedScene - Select loading screen, it must be an existing tscn file.
	- ```SceneManager.emit_signal("loading_finished")``` You must emit `loading_finished` signal to remove the loading screen.
- `AUDIO_FADE_ENABLED`: bool - Enable fading of background music between scenes.
- `BACKGROUND_MUSIC` : AudioStream - Sets the background music for the game.

### Methods
```change_scene_to_file(target: String, transition: String) -> void```
- Changes scenes with transitioning.
- target: String - Path to the scene you want to go to.
- transition: String - The available transitions are: Slide_Up, Slide_Right, Slide_Down, Slide_Left, Fade.

```get_transition_list() -> Array```
- Returns a list of available transition animations as an Array.

```save() -> Dictionary```
- Packs the current scene and takes a screenshot of the scene.
- Returns the packed scene path and screenshot path as a Dictionary.
