class_name Weapon extends Node2D

@onready var marker = $Pivot
@onready var animation = $swordAnimation
@onready var weaponSprite: Sprite2D = $Pivot/weapon_sprite
@export var attack: AttackComponent
@onready var attackRange = $Pivot/ChargeArea/CollisionShape2D

@export var chargeTime: float = 0.0
var inUse: bool = false

func use(target):
	inUse = true
	animation.play("attack1")
	marker.look_at(target)
	
	if get_global_mouse_position().x - target.x < 0:
		if marker.scale.y == 1:
			marker.scale.y = -1
	else:
		if marker.scale.y == -1:
			marker.scale.y = 1

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.damage(attack)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack1":
		inUse = false
