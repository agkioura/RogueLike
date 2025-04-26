class_name Patrol extends State

@export var chase: State

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

@onready var nav: NavigationAgent2D = $"../../../NavigationAgent2D"
@onready var waitTimer: Timer = $"../../../PatrolWaitTimer"

func getRandomPoint() -> Vector2:
	return Vector2(rng.randf_range(parent.global_position.x - 50, parent.global_position.x + 50), rng.randf_range(parent.global_position.y - 50, parent.global_position.y + 50))
	
func enterState() -> void:
	parent.animation.play(animationName)
	nav.target_position = getRandomPoint()
	print("Enemy entered patrol state")

func processPhysics(delta : float) -> State:
	if parent.target:
		return chase
		
	var next_point = nav.get_next_path_position()
	var local_target = to_local(next_point)
	if local_target.length() > 2.0:
		var dir = local_target.normalized()
		parent.velocity = dir * parent.speed
		if parent.velocity.x > 0:
			if parent.sprite.scale.x == -1:
				parent.sprite.scale.x *= -1
		else:
			if parent.sprite.scale.x == 1:
				parent.sprite.scale.x *= -1
	else:
		parent.velocity = Vector2.ZERO
	
	parent.move_and_slide()
	return null

func _on_target_area_body_entered(body: Node2D) -> void:
	if body is Player:
		parent.target = body

func _on_navigation_agent_2d_navigation_finished() -> void:
	waitTimer.wait_time = randf_range(2, 3)
	parent.animation.stop()
	waitTimer.start()

func _on_patrol_wait_timer_timeout() -> void:
	parent.animation.play(animationName)
	nav.target_position = getRandomPoint()
