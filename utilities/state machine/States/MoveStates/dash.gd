class_name Dash extends State

@export var walk: State
@export var timer: Timer

func exitState() -> void:
	if timer and timer.is_stopped():
		timer.start(1)

func processPhysics(delta: float) -> State:
	if timer.is_stopped():
		parent.velocity = parent.dashDirection * parent.speed * 50
		parent.velocity = parent.velocity.move_toward(Vector2.ZERO, 0)
		parent.move_and_slide()
	return walk
