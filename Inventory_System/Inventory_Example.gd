# Inventory_Example.gd - A script for an example scene.
extends Control

var Inventory = preload("res://Inventory_System/Inventory.tscn").instantiate().init(10)
var Item = preload("res://Inventory_System/Item.tscn").instantiate()

func _ready():
	var item = Item.init(1, "test name", 0, 10)
	print(Inventory.get_number_of_items())
	print(item.get_type())
	Inventory.add_item(item, 10)
	print(Inventory.get_number_of_items())
