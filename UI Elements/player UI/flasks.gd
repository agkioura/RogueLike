extends HBoxContainer

@export var flaskCount: int = 1

func _ready() -> void:
	for i in range(flaskCount):
		var flask = TextureRect.new()
		flask.texture = load("res://assets/ui sprites/flask sprites/flask_1.png")
		flask.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		flask.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
		flask.custom_minimum_size = Vector2(16, 16)
		add_child(flask)
