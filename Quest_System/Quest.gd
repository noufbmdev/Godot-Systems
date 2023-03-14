# Quest.gd - A script for managing a single quest.
extends Node
enum TYPE {MAIN, SIDE, REOCCURENT}

var id: int # Used to identify the quest.
var type: TYPE
var description: String
var pre_requisites: Array # Stores an array of quest objects that must be completed for the quest to trigger.
var objectives: Array # Requirements that must be fulfilled to complete the quest.
var rewards: Array # Stores a list of Item objects.
var completed: bool = false

func init(id: int, name: String, type: TYPE, description: String, pre_requisites: Array, objectives: Array, rewards: Array) -> Node:
	self.id = id
	self.name = name
	self.type = type
	self.description = description
	self.pre_requisites = pre_requisites
	self.objectives = objectives
	self.rewards = rewards
	
	return self

func is_completed() -> bool:
	return completed

func is_available() -> bool:
	return pre_requisites.all(is_completed)

func complete():
	self.completed = true
	
	# TODO: give rewards to player
	for reward in rewards:
		pass

func is_objective_completed(objective) -> bool:
	return objective.completed

func complete_objective(objective_index: int):
	self.objectives[objective_index].completed = true
	
	if self.objectives.all(is_objective_completed):
		complete()

func get_type() -> String:
	var type_string
	match self.type:
		TYPE.MAIN:
			type_string = "Main"
		TYPE.SIDE:
			type_string = "Side"
		TYPE.REOCCURENT:
			type_string = "Reoccurent"
	return type_string
	
