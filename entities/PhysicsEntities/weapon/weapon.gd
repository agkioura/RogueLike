class_name Weapon extends Node2D

@export_enum("none", "sword", "rusty sword") var weaponType: int
	
@onready var marker = $Pivot
@onready var animation = $swordAnimation
@onready var charge_animation: AnimationPlayer = $chargeAnimation

@onready var weaponSprite: Sprite2D = $Pivot/weapon_sprite
@export var attack: AttackComponent
@onready var attackRange = $Pivot/ChargeArea/CollisionShape2D
@onready var chargeBar: ProgressBar = $Pivot/ChargeArea/ProgressBar

@export var chargeTime: float = 0.0
var chargeStartTime: int
var inUse: bool = false

var weaponSprites: Dictionary = {
	1: "res://assets/weapons/swords/sword.png",
	2: "res://assets/weapons/swords/rustySword.png"
}

func _ready() -> void:
	if weaponType != 0:
		weaponSprite.texture = load(weaponSprites[weaponType])

func use(target) -> void:
	inUse = true
	animation.play("attack1")
	marker.look_at(target)
	
	if get_global_mouse_position().x - target.x < 0:
		if marker.scale.y == 1:
			marker.scale.y = -1
	else:
		if marker.scale.y == -1:
			marker.scale.y = 1
			
func charge() -> void:
	charge_animation.speed_scale = 1 / chargeTime
	charge_animation.play("charge")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.damage(attack)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack1":
		inUse = false
