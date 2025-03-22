class_name Attack extends State

@export var idle: State
@export var walk: State

var finished = false

func enterState() -> void:
	super()
	animationName = parent.facing + "_attack"
	parent.velocity = Vector2.ZERO
	parent.animation.play(animationName)
	print("Entered attack state")
	
func processFrame(delta: float) -> State:
	if finished:
		print("finished")
		finished = false
		return walk
	return null

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if animationName == anim_name:
		finished = true
