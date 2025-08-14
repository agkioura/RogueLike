class_name ChargeAttack extends State

@export var attack: State
@export var weapon: Weapon

@onready var chargeTimer: Timer = $Timer

var charging: bool = false

func _ready() -> void:
	chargeTimer.timeout.connect(_on_timer_timeout)

func enterState() -> void:
	chargeTimer.start(weapon.chargeTime)
	charging = true
	weapon.progress_bar.visible = true
	parent.hitDirection = parent.target.global_position
	weapon.marker.look_at(parent.hitDirection)
	weapon.charge()
		
func processFrame(delta: float) -> State:
	if charging:
		return null
	weapon.progress_bar.visible = false
	return attack
	
func _on_timer_timeout():
	charging = false
