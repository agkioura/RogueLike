class_name Idle extends State

@export var walk : State
@export var attack : State

func enterState() -> void:
	super()
	animationName = parent.facing + "_idle"
	parent.velocity = Vector2.ZERO
	parent.animation.play(animationName)
	print("Entered idle state")
	
func processInput(event: InputEvent) -> State:
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		return walk
	if Input.is_action_just_pressed("attack"):
		return attack
	return null
