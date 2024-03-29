# 💾 Save Manager

> ℹ️ Try it out!
> Open and run **Save_Example.tscn** in Godot engine.

## Features
- Single Save
- Multiple Saves
- Autosave
	- It can be triggered (enter new area) or periodic (every 10 mins).

## Setup
An instance of the scene manager needs to be globally accessible, in godot you can achieve that
through autoload.
1. Autoload SaveManager.tscn: Project > Project Settings > Autoload
2. Call functions on SaveManager: ```SaveManager.function()```

## Documentation
### Nodes

### Options
- `AUTOSAVE_ENABLED: bool` - Enable autosave.
- `AUTOSAVE_DURATION: int` - Time between each autosave in seconds.
- `MODE: int` - Save mode where 0 is single save and 1 is multiple saves.
- `MAX_SAVE_NUMBER: int` - Maximum number of save files.
- `SAVE_DIRECTORY: String` - Path where save files will be managed.

### Methods
```get_files() -> PackedStringArray```
- Returns all save files' names stored in SAVE_DIRECTORY as a PackedStringArray.

```get_file_path(save_name: String) -> String```
- Returns a save file's path by its name.
- save_name: String - Name of the save.

```set_save_data(save_name: String) -> void```
- Sets the current save file name and its data.
- Loads a save file's contents by its name into the game.
- save_name: String - Name of the save.

```write() -> void```
- Prepares data and saves it in the currently selected save file.

```read(save_name) -> Dictionary```
- Returns the contents of a save file by its name as a Dictionary.
- save_name: String - Name of the save.

```delete(save_name) -> void```
- Delete a file by its name in SAVE_DIRECTORY.
- save_name: String - Name of the save.

```autosave() -> void```
- Gets called everytime the autosave timer has timed out.
- Saves currently selected save file.
