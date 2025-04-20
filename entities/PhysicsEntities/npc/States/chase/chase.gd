class_name Chase extends State

@export var patrol: State
var target: PhysicsEnity = null

func enterState() -> void:
	super()
	print("Enemy entered chase state")
	
func processPhysics(delta : float) -> State:
	if !target:
		return patrol
	parent.position = parent.position.move_toward(target.position, parent.speed * delta)
	return null



func _on_target_area_body_exited(body: Node2D) -> void:
	if body is Player:
		target = null
