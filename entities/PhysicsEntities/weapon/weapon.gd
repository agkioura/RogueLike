class_name Weapon extends Node2D

@onready var marker = $Pivot
@onready var animation = $AnimationPlayer
@onready var weaponSprite: Sprite2D = $Pivot/Sprite2D
@export var attack: AttackComponent
var type: int

func use(target):
	weaponSprite.frame = type
	marker.look_at(target)
	
	if target.x - target.x < 0:
		marker.scale.y = -1
	else:
		marker.scale.y = 1

func _on_area_2d_area_entered(area: Area2D) -> void:
	var parent = self.get_parent()
	var other = area.get_parent()
	if area is HitboxComponent and parent != other and ((parent is Player and other is Enemy) or (parent is Enemy and other is Player)):
		area.damage(attack)
