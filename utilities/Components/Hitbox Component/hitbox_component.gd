class_name HitboxComponent extends Area2D

@export var healthComponent: HealthComponent
@onready var parent := self.get_parent()

func damage(attack: AttackComponent):
	var source := attack.get_parent().get_parent()
	var directionToSource := Vector2(parent.global_position.x - source.global_position.x, parent.global_position.y - source.global_position.y)
	parent.velocity = directionToSource * attack.knockbackForce
	parent.move_and_slide()
	if healthComponent:
		healthComponent.updateHealth(attack.damage())
