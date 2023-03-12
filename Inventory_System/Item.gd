# Item.gd - A script for any item in the game.

enum TYPE {WEAPON, ARMOR, CONSUMABLE, QUEST_ITEM}

class Item:
	var id: int
	var name: String
	var type: TYPE
	var quantity: int
	var price: int

	func increase_quantity(amount: int):
		quantity += amount

	func decrease_quantity(amount: int):
		if quantity >= amount:
			quantity -= amount
			print("Quantity of item " + name + " decreased by " + str(amount))
		else:
			print("Not enough quantity.")
