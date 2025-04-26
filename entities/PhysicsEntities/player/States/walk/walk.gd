class_name Walk extends State

@export var idle : State

@export var moveSpeed : int = 50

func enterState() -> void:
	super()
	parent.animation.play(animationName)
	
func exitState() -> void:
	parent.animation.stop()
	
func processInput(event : InputEvent) -> State:
	if !Input.get_vector("left", "right", "up", "down"):
		return idle
	return null
	
func processPhysics(delta: float) -> State:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction == Vector2.ZERO:
		return idle
	parent.facingDirection = direction
	parent.velocity = direction * moveSpeed
	
	var mouse_position = get_global_mouse_position()
	if mouse_position.x - global_position.x < 0:
		if (parent.sprite.scale.x == 1):
			parent.sprite.scale.x *= -1
	else:
		if (parent.sprite.scale.x == -1):
			parent.sprite.scale.x *= -1
	parent.move_and_slide()
	return null
