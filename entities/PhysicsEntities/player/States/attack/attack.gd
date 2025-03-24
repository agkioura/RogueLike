class_name Attack extends State

@export var notAttacking: State
@export var weapon: Weapon

var finished = false

func enterState() -> void:
	super()
	animationName = "attack"
	weapon.animation.play(animationName)
	weapon.use()
	print("Entered attack state")
	
func processFrame(delta: float) -> State:
	if weapon.animation.is_playing():
		return null
	return notAttacking
