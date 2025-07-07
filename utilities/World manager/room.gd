class_name Room extends Node2D

signal exit

var doors = []
var map : Node2D
var width: int = 32 * 16
var height: int = 32 * 10
var spawnCordinates : Vector2
@onready var player_detector: Area2D = $playerDetector

@onready var right: TileMapLayer = preload("res://levels/tilemap layers/room_components/right_door.tscn").instantiate()
@onready var left: TileMapLayer = preload("res://levels/tilemap layers/room_components/left_door.tscn").instantiate()
@onready var up: TileMapLayer = preload("res://levels/tilemap layers/room_components/up_door.tscn").instantiate()
@onready var down: TileMapLayer = preload("res://levels/tilemap layers/room_components/down_door.tscn").instantiate()
@onready var floor: TileMapLayer = preload("res://levels/tilemap layers/room_components/floor.tscn").instantiate()

func setSpawn(x, y) -> void:
	spawnCordinates = Vector2(x * width + width / 2, y * height + height / 2)

func setPosition(x, y) -> void:
	global_position = Vector2(x * width, y * height)

func _ready() -> void:
	var room = Node2D.new()
	room.add_child(right)
	room.add_child(left)
	room.add_child(up)
	room.add_child(down)
	room.add_child(floor)
	self.add_child(room)
	map = room
	
	player_detector.body_entered.connect(_on_room_entered)
	player_detector.body_exited.connect(_on_room_exited)

func _on_room_entered(body: Node2D):
	if body is Player:
		Events.entered_room.emit(self)

func _on_room_exited(body: Node2D):
	if body is Player:
		self.exit.emit()
