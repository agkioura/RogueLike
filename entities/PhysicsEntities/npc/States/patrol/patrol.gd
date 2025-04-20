class_name Patrol extends State

@export var chase: State

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var direction: Vector2 = Vector2.ZERO
var target: PhysicsEnity = null

func getRandomPoint() -> void:
	direction = Vector2(rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0)).normalized()
	
func enterState() -> void:
	super()
	getRandomPoint()
	print("Enemy entered patrol state")

func processPhysics(delta : float) -> State:
	if target:
		chase.target = target
		target = null
		return chase
	parent.velocity = direction * parent.speed
	parent.move_and_slide()
	return null
	
func _on_patrol_timer_timeout() -> void:
	getRandomPoint()

func _on_target_area_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body
