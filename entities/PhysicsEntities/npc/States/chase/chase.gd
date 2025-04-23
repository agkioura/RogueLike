class_name Chase extends State

@export var patrol: State

@onready var nav: NavigationAgent2D = $"../../NavigationAgent2D"

func enterState() -> void:
	super()
	print("Enemy entered chase state")
	if parent.target:
		parent.animation.play(animationName)
		nav.target_position = parent.target.global_position

	
func processPhysics(delta : float) -> State:
	if !parent.target:
		return patrol
		
	var dir = to_local(nav.get_next_path_position()).normalized()
	parent.velocity = dir * parent.speed
	
	if parent.velocity.x > 0:
		if $"../../Sprite2D".scale.x == -1:
			$"../../Sprite2D".scale.x *= -1
	else:
		if $"../../Sprite2D".scale.x == 1:
			$"../../Sprite2D".scale.x *= -1
	parent.move_and_slide()
	return null


func _on_target_area_body_exited(body: Node2D) -> void:
	if body is Player:
		parent.target = null

func _on_path_timer_timeout() -> void:
	if parent.target:
		nav.target_position = parent.target.global_position
