class_name EnemyAttack extends State

@export var notAttacking: State
@export var weapon: Weapon
var variation: int = 0

var finished = false

func enterState() -> void:
	parent.weaponSprite.visible = false
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
	
func exitState() -> void:
	parent.weaponSprite.visible = true
	
func processFrame(delta: float) -> State:
	if weapon.animation.is_playing():
		return null
	return notAttacking
