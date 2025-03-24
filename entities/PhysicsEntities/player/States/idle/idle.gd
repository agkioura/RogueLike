class_name Idle extends State

@export var walk : State

func enterState() -> void:
	super()
	animationName = parent.facing + "_idle"
	parent.velocity = Vector2.ZERO
	parent.animation.play(animationName)
	print("Entered idle state")
	
func processInput(event: InputEvent) -> State:
	if Input.get_vector("left", "right", "up", "down"):
		return walk
	return null
