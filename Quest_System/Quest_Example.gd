# Quest_Example.gd - A script for an example scene.
extends Control

# Preload and instantiate required scenes
var QuestManager = preload("res://Quest_System/QuestManager.tscn").instantiate()
var Quest = preload("res://Quest_System/Quest.tscn").instantiate()

# Define the quests container
@onready var container = $HSplitContainer/ItemList

func _on_button_pressed():
	var quest_name = $HSplitContainer/Panel/VBoxContainer/TextEdit.text
	# Initialize a quest
	var quest = Quest.init(1, quest_name, 0, "", [], [], [])
	# Add quest to player's quest list
	QuestManager.add_quest(quest)
	# Update the item list
	update_list()

func update_list():
	for quest in QuestManager.Quests:
		container.add_item(QuestManager.Quests[quest].name)
