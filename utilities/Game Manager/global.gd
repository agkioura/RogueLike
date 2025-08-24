extends Node

var gameManager: GameManager
var fullscreen: bool = false

@onready var rng = RandomNumberGenerator.new()

var player: Player
var camera: Camera2D
