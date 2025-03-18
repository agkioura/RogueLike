class_name State 
extends Node2D


@export var animationName : String 
var parent: Player

func enterState() -> void:
	pass

func exitState() -> void:
	pass
	
func processPhysics(delta : float) -> State:
	return null
	
func processInput(event : InputEvent) -> State:
	return null
	
func processFrame(delta: float) -> State:
	return null
