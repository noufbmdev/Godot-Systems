# InventoryManager.gd - A script for managing player's inventory.
extends Node

@export var INVENTORY_CAPACITY = 10
@export var SLOT_CAPACITY = 99

var inventory: Array = [] # Stores a list of Slot scenes.

func init(capacity: int) -> Node:
	SLOT_CAPACITY = capacity
	return self

# Check if an item is in the inventory
func has_item(item) -> bool:
	return item in inventory

# Get the number of items in the inventory
func get_size() -> int:
	return inventory.size()

func get_slot(id: int) -> Control:
	return inventory[id]

# Add an item to the inventory
# TODO: on slot max capacity, add new slot with item else increase quantity
func add_item(item, amount: int):
	# If the inventory is not full, add the item
	if inventory.size() < INVENTORY_CAPACITY:
		inventory.append({"item": item, "quantity": amount})
		print("Added ", item.name, " to inventory.")
	else:
		print("Inventory is full, cannot add item.")

# Remove an item from the inventory
# TODO: on 0, remove item completely else decrease quantity
func remove_item(item, amount: int):
	# If the item is in the inventory, remove it
	if item in inventory:
		var index = inventory.find(item)
		inventory.remove_at(index)
		print("Removed ", item.name, " from inventory.")
	else:
		print("Item not found in inventory.")

# Upgrade inventory capacity by 10 for each upgrade
func increase_capacity():
	INVENTORY_CAPACITY += 10
	print("Inventory capacity has been increase to " + INVENTORY_CAPACITY + ".")
