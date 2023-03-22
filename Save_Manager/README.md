## Planned Features
- Camera Zoom
- Pause Screen
- Scene Teleport

## Guide
1. Autoload SaveManager.tscn: Project > Project Settings > Autoload
2. Call functions on SaveManager: ```SaveManager.function()```

> Open the example scene in this folder to test it out.

### Options
- `AUTOSAVE_ENABLED: bool` - Enable autosave.
- `AUTOSAVE_DURATION: int` - Time between each autosave in seconds.
- `MODE: int` - Save mode where 0 is single save and 1 is multiple saves.
- `MAX_SAVE_NUMBER: int` - Maximum number of save files.
- `SAVE_DIRECTORY: String` - Path where save files will be managed.

### Methods
```get_file_path(save_name: String) -> String```
- Returns a save file's path by its name.
- save_name: String - Name of the save.

```set_save_data(save_name: String) -> void```
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

```get_files() -> PackedStringArray```
- Returns all save files in SAVE_DIRECTORY as a PackedStringArray.

```autosave() -> void```
- Gets called everytime the autosave timer has timed out.
- Saves currently selected save file.
