# Dialog System [PLANNING PHASE]
The dialog system accepts a string or a list of strings as input, formats the input, handles tags,
and displays it on the screen. The system allows you to customize almost everything about it but for
more complex layouts like having two speakers' portraits fade in and out is not supported right now,
you will have to adjust the code a bit.

> ℹ️ Try it out!
> Open and run **Dialog_Example.tscn** in Godot engine.

## Features
- Dialog Tags ==[INCOMPLETE]==
This system uses Godot engine's RichTextLabel node to display dialog text, RichTextLabel allows for
complex formatting using [BBCodes](https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html).
However, I will be extending that to add more tags and text effects as defined in the documentation section.
- Dialog Box Customization ==[INCOMPLETE]==
	- The ability to change almost everything about the dialog box (colors, textures, layout...).
	- The ability to set and use a single theme or varying themes based on the speaking character.
- Dialog Characters ==[INCOMPLETE]==
	- Define the characters within the game with their name, portraits, theme, sound, etc.
	- Show character name from the first time or wait until it is revealed to the player.
- Dialog Emotion ==[INCOMPLETE]==
	- You can set an unlimited number of emotions for the characters.
	- Attach a portrait of each character for each emotion.
- Dialog Sounds ==[INCOMPLETE]==
	- Enable and define Blip sounds for each character.
	- Enable and define audio for each piece of dialog text.
- Dialog Prompts ==[INCOMPLETE]==
	- Next Page Prompt
	- TextField Prompt
	- Options Prompt
- QoL Features ==[INCOMPLETE]==
	- Skip the whole dialog.
	- Automatically go to the next piece of dialog.

# Documentation

## Setup
1. Add the system to your project.
	You have 3 ways to do this, choose the one that fits your project:
		1. Autoload the DialogManager scene and call fucntions on it from any script. (Singleton Method)
		2. Add it as a node inside a scene and call functions on it from the scene's script. (Limited)
		3. Create an instance of it from a script and add it to the current scene then call functions on it. (Limited)
2. Configure the system's behavior.
	- Inside DialogManager.gd, enable or disable things like skipping dialog, automatically going
	to the next dialog text.
	- If you want to allow the player to change certain system behavior then you can use the functions
	defined below by connecting them to your settings page but this will only work using the Singleton method.
	Otherwise, you will have to save the player's settings and pass them to the DialogManager instance or node
	through a script.
3. Set the default theme.
	You can do that in the DefaultDialog.tscn, both in Godot engine editor and inside the script
	attached to the scene.
4. Define the emotions.
5. Define the characters.

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
- Required Nodes
	- Dialog Box
	- Dialog Text
- Optional Nodes
	- Next Prompt
	- Speaker Name
	- Speaker Portrait
	- TextField Prompt
	- Options Prompt
### Signals
### Variables
### Methods
