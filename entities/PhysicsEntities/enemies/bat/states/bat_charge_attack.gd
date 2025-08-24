class_name BatChargeAttack extends State

@export var attack: State

@onready var chargeTimer: Timer = $Timer
@export var animation: AnimationPlayer 
@export var attackIndicator: Sprite2D

func enterState() -> void:
	parent.velocity = Vector2.ZERO
	animation.play("charge_attack")
	attackIndicator.visible = true

func exitState() -> void:
	animation.stop()
	attackIndicator.visible = false

func processFrame(delta: float) -> State:
	if animation.is_playing():
		return null
	return attack
