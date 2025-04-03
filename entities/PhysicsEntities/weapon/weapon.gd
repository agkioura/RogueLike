class_name Weapon extends Node2D

@onready var marker = $Pivot
@onready var animation = $AnimationPlayer
@onready var weaponSprite: Sprite2D = $Pivot/Sprite2D
@export var attack: AttackComponent
var type: int

func use():
	weaponSprite.frame = type
	var mouse_position = get_global_mouse_position()
	marker.look_at(mouse_position)
	
	if mouse_position.x - global_position.x < 0:
		marker.scale.y = -1
	else:
		marker.scale.y = 1

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.damage(attack)
