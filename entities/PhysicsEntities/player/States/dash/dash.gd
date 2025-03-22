class_name Dash extends State

@export var walk : State
var dashSpeed = 10
var stop = false

func enterState() -> void:
	super()
	animationName = parent.facing + "_idle"
	parent.canDash = false
	parent.animation.play(animationName)
	print("Entered dash state")
	
func exitState() -> void:
	parent.dashTimer.start()
	
func processPhysics(delta: float) -> State:
	if !stop:
		parent.velocity += dashSpeed * parent.facingDirection
		parent.move_and_slide()
		return null
	stop = false
	return walk


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if animationName == anim_name:
		stop = true
