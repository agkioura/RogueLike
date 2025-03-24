class_name Weapon extends Node2D

@export var type: String
@onready var marker = $Pivot
@onready var animation = $AnimationPlayer

func use():
	marker.look_at(get_global_mouse_position())
