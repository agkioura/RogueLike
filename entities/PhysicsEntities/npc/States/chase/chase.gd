class_name Chase extends State

@export var patrol: State

@onready var nav: NavigationAgent2D = $"../../../NavigationAgent2D"

var approachRadius: int = 30

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
	var distanceFromTarget := sqrt(pow(parent.global_position.x - parent.target.global_position.x, 2) + pow(parent.global_position.y - parent.target.global_position.y, 2))
	if distanceFromTarget > approachRadius:
		parent.velocity = dir * parent.speed
	else:
		parent.velocity = Vector2.ZERO
		
	var directionToTarget := Vector2(parent.target.global_position.x - parent.global_position.x, parent.target.global_position.y - parent.global_position.y)
	if directionToTarget.x > 0:
		if parent.sprite.scale.x == -1:
			parent.sprite.scale.x *= -1
	else:
		if parent.sprite.scale.x == 1:
			parent.sprite.scale.x *= -1
	parent.move_and_slide()
	return null


func _on_target_area_body_exited(body: Node2D) -> void:
	if body is Player:
		parent.target = null

func _on_path_timer_timeout() -> void:
	if parent.target:
		nav.target_position = parent.target.global_position
