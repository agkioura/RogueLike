class_name NotAttacking extends State

@export var attack: State
	
func processInput(event: InputEvent) -> State:
	if Input.is_action_pressed("attack"):
		return attack
	return null
