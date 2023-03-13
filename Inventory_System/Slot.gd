# Slot.gd - A script for managing a slot within a player's inventory.
extends Control

const Item = preload("res://Inventory_System/Item.tscn")
const ItemClass = preload("res://Inventory_System/Item.gd")

# TODO: add max capacity for each slot, create new slot on max reached
var item: ItemClass = null
var quantity: int = 0

func init(item: ItemClass, quantity: int):
	self.item = item
	self.quantity = quantity

func increase_quantity(amount: int):
	quantity += amount

func decrease_quantity(amount: int):
	if quantity >= amount:
		quantity -= amount
		print("Quantity of item " + item.name + " decreased by " + str(amount))
	else:
		print("Not enough quantity.")
