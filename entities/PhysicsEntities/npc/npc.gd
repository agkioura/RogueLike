extends PhysicsEnity

@onready var label = $CenterContainer/Label
@onready var health = $HealthComponent

func _init() -> void:
	super("npc")

func _process(delta: float) -> void:
	var maxHealth = health.maxHealth
	var currentHealth = health.health
	label.text = str(currentHealth) + "/" + str(maxHealth)
