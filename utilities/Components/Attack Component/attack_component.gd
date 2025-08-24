class_name AttackComponent extends Node

@export var dmg: float
@export_enum("slash", "thrust", "dash") var dmgType: int
@export var attackSpeed: float = 0.5
@export var knockbackForce: int = 60

func damage() -> float:
	return dmg
