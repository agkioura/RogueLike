class_name InventoryComponent extends Node2D

var hotbar = []

func _check_if_hotbar_is_not_full():
	return hotbar.lentgh<10

func _add_item_to_hotbar():
	if Input.action_press("interact") && _check_if_hotbar_is_not_full() = true:
