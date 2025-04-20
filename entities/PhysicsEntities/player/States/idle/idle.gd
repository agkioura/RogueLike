class_name Idle extends State

@export var walk : State

func enterState() -> void:
	super()
	$"../../PlayerSprite".frame = 0;
	parent.velocity = Vector2.ZERO
	
func processInput(event: InputEvent) -> State:
	if Input.get_vector("left", "right", "up", "down"):
		return walk
	return null
	
func processFrame(delta: float):
	var mouse_position = get_global_mouse_position()
	if mouse_position.x - global_position.x < 0:
		if ($"../../PlayerSprite".scale.x == 1):
			$"../../PlayerSprite".scale.x *= -1
	else:
		if ($"../../PlayerSprite".scale.x == -1):
			$"../../PlayerSprite".scale.x *= -1
