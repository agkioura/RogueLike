class_name Attack extends State

@export var notAttacking: State

var finished = false

func enterState() -> void:
	super()
	animationName = parent.facing + "_attack"
	parent.velocity = Vector2.ZERO
	parent.animation.play(animationName)
	print("Entered attack state")
	
func processFrame(delta: float) -> State:
	print("Attack")
	return notAttacking
