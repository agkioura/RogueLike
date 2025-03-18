class_name Player 
extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var dashTimer = $dashCooldown
@onready var stateMachine = $StateMachine

var facing = "down"
var facingDirection : Vector2
var canDash = true

func _ready() -> void:
	stateMachine.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	stateMachine.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateMachine.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateMachine.processFrame(delta)
	

func _on_dash_cooldown_timeout() -> void:
	canDash = true
