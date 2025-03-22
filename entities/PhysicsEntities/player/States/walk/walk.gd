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
	if !Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		return idle
	return null
	
func processPhysics(delta: float) -> State:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction == Vector2.ZERO:
		return idle
	parent.facingDirection = direction
	parent.velocity = direction * moveSpeed
	
	var facing = "down"
	if parent.velocity.y < 0: facing = "up"
	elif parent.velocity.x > 0: facing = "right"
	elif parent.velocity.x < 0: facing = "left"
	animationName = facing + "_walk"
	parent.facing = facing
	parent.animation.play(animationName)
	parent.move_and_slide()
	return null
