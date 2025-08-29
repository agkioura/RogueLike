extends HBoxContainer

@export var flaskCount: int = 1

func _ready() -> void:
	for i in range(flaskCount):
		var flask = TextureRect.new()
		flask.texture = load("res://assets/ui sprites/flask sprites/flask_1.png")
		add_child(flask)
