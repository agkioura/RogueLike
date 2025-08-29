class_name InventoryComponent extends Node2D

var inventory: Array = []
var inventorySize: int = 10

func checkInventoryCapacity():
	return inventory.size() < inventorySize

func add(item: Item):
	inventory.push_back(item.interact_name)
	print("--------------------")
	for i in inventory:
		print(i)
	print("--------------------")
	pass

func _add_item_to_hotbar():
	pass
