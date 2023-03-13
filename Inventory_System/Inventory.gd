# Inventory.gd - A script for managing player's inventory.
extends Control

var Slot = preload("res://Inventory_System/Slot.tscn")
const SlotClass = preload("res://Inventory_System/Slot.gd")
var Item = preload("res://Inventory_System/Item.tscn")
const ItemClass = preload("res://Inventory_System/Item.gd")

signal inventory_updated # Used to update UI
var Inventory = [] # Stores a list of Slot objects.
var capacity = 0

func init(capacity: int):
	self.capacity = capacity
	
	return self

func get_slot(id: int) -> SlotClass:
	return Inventory[id]

# Add an item to the inventory
func add_item(item: ItemClass, amount: int):
	# If the inventory is not full, add the item
	if len(Inventory) < capacity:
		var item_slot = Slot.instantiate().init(item, amount)
		Inventory.append(item_slot)
		print("Added ", item.name, " to inventory.")
		inventory_updated.emit()
	else:
		print("Inventory is full, cannot add item.")

# Remove an item from the inventory
func remove_item(item: ItemClass, amount: int):
	# If the item is in the inventory, remove it
	if item in Inventory:
		var index = Inventory.find(item)
		Inventory.remove_at(index)
		print("Removed ", item.name, " from inventory.")
		inventory_updated.emit()
	else:
		print("Item not found in inventory.")

# Check if an item is in the inventory
func has_item(item):
	return item in Inventory

# Get the number of items in the inventory
func get_number_of_items():
	return Inventory.size()

# Upgrade inventory capacity by 10 for each upgrade
func increase_capacity():
	capacity += 10
	inventory_updated.emit()
