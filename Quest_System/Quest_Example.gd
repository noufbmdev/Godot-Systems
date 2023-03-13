# Quest_Example.gd - A script for an example scene.
extends Control

var QuestManager = preload("res://Quest_System/QuestManager.tscn").instantiate()
var Quest = preload("res://Quest_System/Quest.tscn").instantiate()

func _ready():
	var quest = Quest.init(1, "quest name", 0, "", [], [], [])
	print(QuestManager.get_number_of_quests())
	print(quest.get_type())
	QuestManager.add_quest(quest)
	print(QuestManager.get_number_of_quests())
