# QuestManager.gd - A script that manages multiple quests, their conditions, and requirements.
class QuestManager:
	const Quest = preload("res://Quest_System/Quest.gd")
	var quests: Dictionary # A dict of all quests in the game stored as quest object.

	func init(quests: Dictionary):
		quests = quests

	func add_quest(quest: Quest):
		quests[quest.id] = quest

	func remove_quest(id: int):
		quests.erase(id)

	func get_quest(id: int) -> Quest:
		return quests[id]

	func get_all_quests() -> Dictionary:
		return quests

	func get_available_quests() -> Array:
		var available_quests = []
		for quest in quests:
			if not quests[quest].completed and quests[quest].available:
				available_quests.append(quest)
		return available_quests
	
	func get_completed_quests() -> Array:
		var completed_quests = []
		for quest in quests:
			if quests[quest].completed:
				completed_quests.append(quest)
		return completed_quests
