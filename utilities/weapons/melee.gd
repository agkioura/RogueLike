class_name Melee extends Weapon

@export var attack: AttackComponent

@export_enum("none", "dash") var meleeType: int
	
@onready var marker = $Pivot
@onready var animation = $meleeAnimation
@onready var charge_animation: AnimationPlayer = $chargeAnimation

@onready var meleeSprite: Sprite2D = $Pivot/melee_sprite
@onready var progress_bar: ProgressBar = $Pivot/Area2D/ProgressBar

var chargeStartTime: int

var attackType: Dictionary = {
	2: "dash"
}

func _ready() -> void:
	meleeSprite.visible = false
	progress_bar.visible = false

func use(target) -> void:
	inUse = true
	get_parent().enemy_sprite.visible = false
	animation.play("attack_" + attackType[attack.dmgType])
	marker.look_at(target)

func charge() -> void:
	charge_animation.speed_scale = 1 / chargeTime
	charge_animation.play("charge_" + attackType[attack.dmgType])

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
