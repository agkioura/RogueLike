class_name AttackComponent extends Node

@export var dmg: float
@export var effect: String
@export var knockbackForce: int = 60

func damage() -> float:
	return dmg
