# 💬 Dialog System

<p align="center">
  <img src="https://github.com/noufbmdev/Godot-Systems/assets/53019688/762553ac-b8b9-406e-8a96-1a14c7ea114f" alt="animated" />
</p>

The dialog system accepts a string or a list of strings as input, formats the input, handles tags,
and displays it on the screen. The system allows you to customize almost everything about it but for
more complex layouts like having two speakers' portraits fade in and out is not supported right now,
you will have to adjust the code a bit.

> ℹ️ Try it out!
> Open and run **Dialog_Example.tscn** in Godot engine.

## Features
- Dialog Tags ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
<br/>This system uses Godot engine's RichTextLabel node to display dialog text, RichTextLabel allows for
complex formatting using [BBCodes](https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html).
I will be extending that to add more tags and text effects as defined in the documentation [section](#tags).
- Dialog Customization ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- The ability to change almost everything about the dialog (colors, textures, layout...).
	- The ability to set and use a single theme or varying themes based on the speaking character.
- Dialog Characters ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Define the characters within the game with their name, portraits, theme, sound, etc.
	- Show character name from the first time or wait until it is revealed to the player.
- Dialog Emotion ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- You can set an unlimited number of emotions for the characters.
	- Attach a portrait of each character for each emotion.
- Dialog Sounds ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Enable and define Blip sounds for each character.
	- Enable and define audio for each piece of dialog text.
- Dialog Prompts ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Next Page Prompt
	- TextField Prompt
	- Options Prompt
- QoL Features ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Skip the whole dialog.
	- Skip typewritter effect.
	- Toggle automatic next dialog.
	- Toggle typewritter effect.
	- Toggle text effects (wave, tornado, etc).
	- Toggle blip sounds.

## Setup
1. Add it to your project, you have 3 ways to do this.
	1. Autoload the DialogManager scene and call fucntions on it from any script. **(Singleton Method)**
	2. Add it as a node inside a scene and call functions on it from the scene's script. **(Limited)**
	3. Create an instance of it from a script and add it to the current scene then call functions on it. **(Limited)**
2. Configure the system's behavior.
	- Inside DialogManager.gd, enable or disable things like skipping dialog, automatically going
	to the next dialog text.
	- If you want to allow the player to change certain system behavior then you can use the functions
	defined below by connecting them to your settings page but this will only work using the Singleton method.
	Otherwise, you will have to save the player's settings and pass them to the DialogManager instance or node
	through a script which is not currently supported.
3. Set the default theme.
<br/>You can do that in the DefaultDialog.tscn, both in Godot engine editor and inside the script
attached to the scene.
4. Define the emotions.
5. Define the characters.

## Documentation
### Tags
| Tag     | Description                                         |
|---------|-----------------------------------------------------|
| speed   | Change the speed at which each letter is displayed. |
| pause   | Pause the text for any number of seconds.           |
| emotion | Set the emotion of the current speaker.             |
| action  | Set the action of the current speaker.              |

Note that setting the emotion or action of the speaker will send a signal and you can catch that
signal and handle it the way you see fit. By default, the system will try to display the correct
portrait for each emotion. In the case that you are developing a 3D game and don't want to use
portraits, you have to catch that signal and handle it.

### Nodes
- DialogManager (Required)
- DialogBox (Required)
	- SpeakerName: Label
	- DialogText: RichTextLabel (Required)
	- SpeakerPortrait: TextureRect
	- NextPrompt: TextureRect
- TextFieldPrompt
- OptionsPrompt
- Character

### Dialog Manager
- Signals
	- emote
	- action
- Variables
	- dialog_box: DialogBox
	- dialog_text: DialogText
	- next_prompt: NextPrompt
	- speaker_name: SpeakerName
	- speaker_portrait: SpeakerPortrait
	- characters: Dictionary
	- emotions: Enum
	- text_speed: int
	- letter_blip_enabled: bool
- Methods
	- setget: text_speed

### DialogBox
- Signals
	- next
- Variables
	- dialog_text: RichTextLabel
	- speaker_name: Label
	![OPTIONAL](https://img.shields.io/badge/Optional-purple)
	- speaker_portrait: TextureRect
	![OPTIONAL](https://img.shields.io/badge/Optional-purple)
	- next_prompt: TextureRect
	![OPTIONAL](https://img.shields.io/badge/Optional-purple)
	- next_action: String
	![OPTIONAL](https://img.shields.io/badge/Optional-purple)
- Methods
	- set_dialog_text(text: String)
	- get_dialog_text() -> String
	- get_dialog_text_node() -> RichTextLabel
	- set_speaker_name(text: String)
	- get_speaker_name_node() -> Label
	- set_speaker_portrait(texture: Texture2D)
	- get_speaker_portrait_node() -> TextureRect
	- animate_next_prompt():

### Character
- Signals
	None
- Variables
	blip_sounds: Dictionary
- Methods
	- play_blip(letter: String) -> void
	<br/>If `letter_blip_enabled` in DialogManager is set to true it will find the sound that has
	the same name as the letter and plays it. Otherwise, it will play a random sound.
