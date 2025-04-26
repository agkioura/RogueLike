class_name EnemyNotAttacking extends State

@export var attack: State
@export var attackCooldown: Timer 
var shouldAttack = false
var canAttack = true

func initialize() -> void:
	parent.attackRange.connect("body_entered", _on_attack_range_body_entered)
	parent.attackRange.connect("body_exited", _on_attack_range_body_exited)
	attackCooldown.timeout.connect(_on_attack_cooldown_timeout)

func enterState() -> void:
	if !canAttack:
		print("On cooldown")
		attackCooldown.start()
	print("Enemy entered not attacking state")
	
func processFrame(delta: float) -> State:
	if shouldAttack && canAttack:
		canAttack = false
		return attack
	return null


func _on_attack_range_body_entered(body: Node2D) -> void:
	if body == parent.target:
		shouldAttack = true
		
func _on_attack_range_body_exited(body: Node2D) -> void:
	if body == parent.target:
		shouldAttack = false


func _on_attack_cooldown_timeout() -> void:
	if !canAttack:
		print("done")
		canAttack = true
