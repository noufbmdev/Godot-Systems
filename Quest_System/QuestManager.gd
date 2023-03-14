# QuestManager.gd - A script that manages multiple quests, their conditions, and requirements.
extends Node

const MAX_TRACKED_QUESTS = 3

var Quests: Dictionary # Stores a list of all quests.
var Tracked_Quests: Array # Stores a list of player tracked quests.

func init() -> Node:
	return self

# Check if a quest exists
func has_quest(quest) -> bool:
	return quest in Quests

# Gets the number of quests
func get_size() -> int:
	return Quests.size()

func track_quest(quest):
	if Tracked_Quests.size() < 3:
		Tracked_Quests.append(quest)
		print("Quest " + quest.name + " is being tracked.")
	else:
		print("Maximum tracked quests reached.")

func add_quest(quest):
	Quests[quest.id] = quest
	print("Added ", quest.name, " to quest list.")

func remove_quest(id: int):
	Quests.erase(id)

func get_quest(id: int) -> Node:
	return Quests[id]

func get_all_quests() -> Dictionary:
	return Quests

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
