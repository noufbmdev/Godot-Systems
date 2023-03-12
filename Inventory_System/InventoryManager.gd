# InventoryManager.gd - A script for managing player's inventory.
class InventoryManager:
	var Inventory = []
	var Capacity = 10
	const Item = preload("res://Inventory_System/Item.gd")

	# Add an item to the inventory
	func add_item(item):
		# If the inventory is not full, add the item
		if len(Inventory) < Capacity:
			Inventory.append(item)
			print("Added", item, "to inventory.")
		else:
			print("Inventory is full, cannot add item.")

	# Remove an item from the inventory
	func remove_item(item):
		# If the item is in the inventory, remove it
		if item in Inventory:
			Inventory.remove(item)
			print("Removed", item, "from inventory.")
		else:
			print("Item not found in inventory.")

	# Check if an item is in the inventory
	func has_item(item):
		return item in Inventory

	# Get the number of items in the inventory
	func number_of_items():
		return len(Inventory)

	# Upgrade inventory capacity by 10 for each upgrade
	func increase_capacity():
		Capacity += 10
