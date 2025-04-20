class_name Chase extends State

@export var patrol: State

var target: PhysicsEnity
@onready var nav: NavigationAgent2D = $"../../NavigationAgent2D"

func enterState() -> void:
	super()
	print("Enemy entered chase state")

	nav.target_position = target.global_position

	
func processPhysics(delta : float) -> State:
	if !target:
		return patrol
		
	var dir = to_local(nav.get_next_path_position()).normalized()
	parent.velocity = dir * parent.speed
	parent.move_and_slide()
	return null


func _on_target_area_body_exited(body: Node2D) -> void:
	if body is Player:
		target = null

func _on_path_timer_timeout() -> void:
	if target:
		nav.target_position = target.global_position

