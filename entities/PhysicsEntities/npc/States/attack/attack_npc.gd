class_name AttackNpc extends State

@export var notAttacking: State
@export var weapon: Weapon
var variation: int = 0

var finished = false

func enterState() -> void:
	super()
	animationName = "attack"
	if parent.target:
		weapon.use(parent.target.get_global_position())
		if (variation == 0):
			weapon.animation.play(animationName + str(1))
			variation = 1
		else:
			weapon.animation.play(animationName + str(2))
			variation = 0
		
	print("Entered attack state")
	
func processFrame(delta: float) -> State:
	if weapon.animation.is_playing():
		return null
	return notAttacking
