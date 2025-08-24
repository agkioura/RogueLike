extends Control

@onready var player_health_bar: ProgressBar = $playerHealthBar
@onready var after_hit_effect: ProgressBar = $afterHitEffect

func _ready() -> void:
	Global.player.health_component.damaged.connect(_on_health_update)
	var healthComponent = Global.player.health_component
	if healthComponent:
		player_health_bar.max_value = healthComponent.maxHealth
		player_health_bar.value = healthComponent.health

func _on_health_update(healthComponent: HealthComponent) -> void:
	if healthComponent:
		player_health_bar.value = healthComponent.health
		var tween = get_tree().create_tween()
		tween.tween_property(after_hit_effect, "value", healthComponent.health, 1).set_ease(Tween.EASE_OUT)
