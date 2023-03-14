# Inventory_Example.gd - A script for an example scene.
extends Control

# Preload and instantiate required scenes
var InventoryManager = preload("res://Inventory_System/InventoryManager.tscn").instantiate()
var Item = preload("res://Inventory_System/Item.tscn").instantiate()

# Define the items container
@onready var container = $HSplitContainer/ItemList

func _ready():
	# Initialize inventory with inventory size
	InventoryManager = InventoryManager.init(10) 

func _on_button_pressed():
	var item_name = $HSplitContainer/Panel/VBoxContainer/TextEdit.text
	# Initialize an item
	var item = Item.init(1, item_name, 0, 20)
	# Add item to inventory
	InventoryManager.add_item(item, 30)
	# Update the item list
	update_list()

func update_list():
	container.clear()
	for slot in InventoryManager.Inventory:
		container.add_item(slot.item.name)
