class_name Character extends Node

var _name: String
var color: Color
var dialog_box_scene: String
var blips_folder: String
var audios_folder: String
var portraits_folder: String

func create(_name: String, color: Color, dialog_box_scene: String, blips_folder: String, audios_folder: String, portraits_folder: String) -> Dictionary:
	self._name = _name
	self.color = color
	self.dialog_box_scene = dialog_box_scene
	self.blips_folder = blips_folder
	self.audios_folder = audios_folder
	self.portraits_folder = portraits_folder
	
	return {
		"name": _name,
		"color": color,
		"dialog_box_scene": dialog_box_scene,
		"blips_folder": blips_folder,
		"audios_folder": audios_folder,
		"portraits_folder": portraits_folder
	}
