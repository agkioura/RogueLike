extends Camera2D

func _ready() -> void:
	Global.camera = self
	Events.entered_room.connect(func (room):
		self.global_position = room.spawnCordinates
	)

@export var randomStrength: float = 3.0
@export var shakeFade: float = 50.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0
var shake = false

func apply_shake():
	shake_strength = randomStrength
	shake = true
	
func _process(delta: float) -> void:
	
	if shake_strength > 0 && shake:
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)

		offset = randomOffset()
	if shake_strength <= 0:
		shake = false

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
