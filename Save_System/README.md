You need to **autoload** SaveManager.tscn for it to work.

Open **Save_Example.tscn** in Godot and test it out.

### Options
`var AUTOSAVE_ENABLED: bool = false`
- Enable autosave.

`var AUTOSAVE_DURATION: int = 5`
- Duration between each autosave in seconds.

`var MODE: int = 0`
- Save mode where 0 is single save and 1 is multiple saves.

`var MAX_SAVE_NUMBER: int = 1`
- Maximum number of save files.

`var SAVE_DIRECTORY: String = "user://Save/"`
- Path where save files will be stored and retrieved.
