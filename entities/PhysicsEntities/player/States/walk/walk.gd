class_name Walk extends State

@export var idle : State

@export var moveSpeed : int = 50

func enterState() -> void:
	super()
	parent.animation.play(animationName)
	print("Entered walk state")
	
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
	var facing = "down"
	if mouse_position.x - global_position.x < 0:
		facing = "left"
	else:
		facing = "right"
	animationName = facing + "_walk"
	parent.facing = facing
	parent.animation.play(animationName)
	parent.move_and_slide()
	return null
