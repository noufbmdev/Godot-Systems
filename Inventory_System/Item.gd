# Item.gd - A script for a single item in the game.
extends Node

enum TYPE {WEAPON, ARMOR, CONSUMABLE, QUEST_ITEM}

var id: int
var type: TYPE
var price: int
	
# Called after instancing to initialize an instance with data
func init(id: int, name: String, type: TYPE, price: int) -> Node:
	self.id = id
	self.name = name
	self.type = type
	self.price = price
	
	return self

# Returns the type of item as a string
func get_type() -> String:
	var type_string
	match self.type:
		TYPE.WEAPON:
			type_string = "Weapon"
		TYPE.ARMOR:
			type_string = "Armor"
		TYPE.CONSUMABLE:
			type_string = "Consumable"
		TYPE.QUEST_ITEM:
			type_string = "Quest Item"
	return type_string
