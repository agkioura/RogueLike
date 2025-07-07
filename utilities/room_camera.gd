extends Camera2D

func _ready() -> void:
	Events.entered_room.connect(func (room):
		self.global_position = room.spawnCordinates
	)
