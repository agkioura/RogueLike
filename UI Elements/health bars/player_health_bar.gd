extends ProgressBar

func _ready() -> void:
	Global.player.health_component.damaged.connect(_on_health_update)
	var healthComponent = Global.player.health_component
	if healthComponent:
		max_value = healthComponent.maxHealth
		value = healthComponent.health

func _on_health_update(healthComponent: HealthComponent) -> void:
	if healthComponent:
		value = healthComponent.health
