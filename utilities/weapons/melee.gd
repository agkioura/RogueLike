class_name Melee extends Weapon

@export var attack: AttackComponent

@export_enum("none", "dash") var meleeType: int

@onready var marker = $Pivot
@onready var animation = $meleeAnimation

@onready var meleeSprite: Sprite2D = $Pivot/melee_sprite

var chargeStartTime: int

var attackType: Dictionary = {
	2: "dash"
}

func use(target) -> void:
	inUse = true
	get_parent().enemy_sprite.visible = false
	marker.look_at(target)
	animation.play("attack_" + attackType[attack.dmgType])

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.damage(attack)

func _on_melee_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name.contains("attack"):
		inUse = false
		get_parent().enemy_sprite.visible = true
		get_parent().global_position = meleeSprite.global_position

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		area.damage(attack)
