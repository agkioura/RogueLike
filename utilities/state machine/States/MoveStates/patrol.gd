class_name Patrol extends State

@export var chase: State

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

@export var nav: NavigationAgent2D
@export var waitTimer: Timer

func _ready() -> void:
	if waitTimer: waitTimer.timeout.connect(changePoint)
	if nav:
		nav.navigation_finished.connect(_on_navigation_agent_2d_navigation_finished)

func getRandomPoint() -> Vector2:
	return Vector2(rng.randf_range(parent.global_position.x - 500, parent.global_position.x + 500), rng.randf_range(parent.global_position.y - 500, parent.global_position.y + 500))
	
func enterState() -> void:
	if nav:
		changePoint()

func processPhysics(delta : float) -> State:
	if parent.target:
		return chase
	if not nav:
		return null
		
	var next_point = nav.get_next_path_position()
	var direction = global_position.direction_to(next_point)
	parent.velocity = direction * parent.speed
	parent.move_and_slide()
	return null
	
func processFrame(delta: float) -> State:
	if parent.velocity.x > 0:
		if parent.enemy_sprite.scale.x == 1:
			parent.enemy_sprite.scale.x = -1
	else:
		if parent.enemy_sprite.scale.x == -1:
			parent.enemy_sprite.scale.x = 1
			
	return null

func _on_navigation_agent_2d_navigation_finished() -> void:
	waitTimer.wait_time = randf_range(2, 3)
	waitTimer.start()

func changePoint() -> void:
	nav.target_position = getRandomPoint()
