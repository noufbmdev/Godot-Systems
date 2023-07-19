# 🎒 Inventory System

> ℹ️ Try it out!
> Open and run **Inventory_Example.tscn** in Godot engine.

## Features
- Inventory Layout ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Single Slot Size: Every item takes a single slot in the inventory.
	- Varying Slot Size: Every item has a different size slot in the inventory.
- Inventory Scope ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Local: Not connected to other storages, this is good for player inventories.
	- Global: Connected to other storages, this is good for crafting stations.
	- Shared: Can be shared with other players or NPCs.
- Typed Slots ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Slots that store only specified types such as "Potion", "Gear", etc.
- Quest Items ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Toggle visibility in the inventory and letting them take space.
	- Toggle the ability to discard them.
- User Interface ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Sorting: Sort by common properties. (quantity, type, etc.)
	- Filtering: Filter by common properties. (quantity, type, etc.)
	- Search: Search by the name of the item.
	- Category Tabs: Tabs at the top of an inventory container that categorizes by item types.
	- Item Overlay: Shows an overlay box with the item's information while hovering on it.
	- Split Quantity: Split an item by its quantity.
	- Drag and Drop: Move items between containers or slots using drag an drop.
	- Auto Equip: Interacting with an equippable item puts the item in the correct equipped slot.
	- Discard Box: Dropping an item inside of it will remove it from the inventory.
- Bounded Items ![INCOMPLETE](https://img.shields.io/badge/Incomplete-orange)
	- Items that are bounded to a specific player, place, or something in the game.

## Setup
## Documentation
### Nodes
- InventoryManager
- Inventory
- Slot (UI)
- Item (Data)
- Overlay (UI)
