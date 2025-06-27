class_name Room extends Node2D

var doors = []
var map :TileMapLayer

func _ready() -> void:
	var tileMap = load("res://levels/tilemap layers/test_room.tscn")
	var newTileMap = tileMap.instantiate()
	map = newTileMap
	self.add_child(newTileMap)
