# QuestManager.gd - A script that manages multiple quests, their conditions, and requirements.
extends Control

const QuestClass = preload("res://Quest_System/Quest.gd")
const MAX_TRACKED_QUESTS = 3

var Quests: Dictionary # Stores a list of all quests.
var Tracked_Quests: Array # Stores a list of player tracked quests.

func init():
	return self

func track_quest(quest: QuestClass):
	if Tracked_Quests.size() < 3:
		Tracked_Quests.append(quest)
		print("Quest " + quest.name + " is being tracked.")
	else:
		print("Maximum tracked quests reached.")

func add_quest(quest: QuestClass):
	Quests[quest.id] = quest

func remove_quest(id: int):
	Quests.erase(id)

func get_quest(id: int) -> QuestClass:
	return Quests[id]

func get_all_quests() -> Dictionary:
	return Quests

func get_number_of_quests():
	return Quests.size()

func get_available_quests() -> Array:
	var available_quests = []
	for quest in Quests:
		if not Quests[quest].completed and Quests[quest].is_available():
			available_quests.append(quest)
	return available_quests

func get_completed_quests() -> Array:
	var completed_quests = []
	for quest in Quests:
		if Quests[quest].completed:
			completed_quests.append(quest)
	return completed_quests
