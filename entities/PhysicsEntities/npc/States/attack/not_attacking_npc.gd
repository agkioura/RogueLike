class_name NotAttackingNpc extends State

@export var attack: State
var shouldAttack = false
var canAttack = true

func enterState() -> void:
	super()
	if !canAttack:
		print("On cooldown")
		$"../../AttackCoolDown".start()
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


func _on_attack_cool_down_timeout() -> void:
	if !canAttack:
		print("done")
		canAttack = true
