class_name Patrol extends State

@export var chase: State

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

var target: PhysicsEnity
@onready var nav: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var waitTimer: Timer = $"../../PatrolWaitTimer"

func getRandomPoint() -> Vector2:
	return Vector2(rng.randf_range(parent.global_position.x - 50, parent.global_position.x + 50), rng.randf_range(parent.global_position.y - 50, parent.global_position.y + 50))
	
func enterState() -> void:
	super()
	
	nav.target_position = getRandomPoint()

	print("Enemy entered patrol state")

func processPhysics(delta : float) -> State:
	if target:
		chase.target = target
		target = null
		return chase

	var dir = to_local(nav.get_next_path_position()).normalized()
	parent.velocity = dir * parent.speed
	parent.move_and_slide()
	return null


func _on_target_area_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body

func _on_navigation_agent_2d_navigation_finished() -> void:
	waitTimer.wait_time = randf_range(2, 3)
	nav.set_velocity_forced(Vector2.ZERO)
	waitTimer.start()

func _on_patrol_wait_timer_timeout() -> void:
	nav.target_position = getRandomPoint()

