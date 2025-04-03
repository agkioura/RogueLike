class_name Attack extends State

@export var notAttacking: State
@export var weapon: Weapon

var finished = false

func enterState() -> void:
	super()
	$"../../PlayerSprite/weaponSprite".visible = false
	animationName = "attack"
	weapon.use()
	weapon.animation.play(animationName)
	print("Entered attack state")
	
func exitState() -> void:
	$"../../PlayerSprite/weaponSprite".visible = true
	
func processFrame(delta: float) -> State:
	if weapon.animation.is_playing():
		return null
	return notAttacking
