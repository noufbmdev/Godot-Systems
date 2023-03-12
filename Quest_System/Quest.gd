# Quest.gd - A script for managing a single quest.
class Objective:
	var id: int
	var description: String
	var completed: bool = false
	
class Quest:
	var id: int # Used to identify the quest.
	var name: String # The title of the quest.
	var pre_requisites: Array # Stores an array of quest objects that must be completed for the quest to trigger.
	var description: String
	var objectives: Array # Requirements that must be fulfilled to complete the quest.
	var rewards: Array # Quest rewards on completion.
	var completed: bool = false
	
	func init(id: int, name: String, description: String, objectives: Array, rewards: Array):
		self.id = id
		self.name = name
		self.description = description
		self.objectives = objectives
		self.rewards = rewards
	
	func is_completed():
		return completed
	
	func is_available():
		return pre_requisites.all(is_completed)
	
	func complete():
		self.completed = true
		
		# TODO: give rewards to player
	
	func is_objective_completed(objective):
		return objective.completed
	
	func complete_objective(objective_index: int):
		self.objectives[objective_index].completed = true
		
		if self.objectives.all(is_objective_completed):
			complete()
