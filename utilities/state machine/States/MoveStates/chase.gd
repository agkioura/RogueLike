class_name Chase extends State

@export var patrol: State
@export var chargeAttack: State

@export var nav: NavigationAgent2D
@export var agroRadius: Area2D

func _ready() -> void:
	if agroRadius:
		agroRadius.body_exited.connect(_on_target_area_body_exited)

func enterState() -> void:
	if parent.target:
		nav.target_position = parent.target.global_position
	
	parent.animation_player.play("walk")
	
func exitState() -> void:
	parent.animation_player.stop()
	
func processPhysics(delta : float) -> State:
	if !parent.target:
		return patrol
	if (parent.global_position.distance_to(parent.target.global_position) <= 32):
		return chargeAttack
		
	var next_point = parent.target.global_position
	var direction = global_position.direction_to(next_point).normalized()
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

func _on_target_area_body_exited(body: Node2D) -> void:
	if body is Player:
		parent.target = null
