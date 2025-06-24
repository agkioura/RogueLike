class_name Player extends PhysicsEnity

@export var speed: float = 150
@export var dashSpeed: float = 200
var dashDirection: Vector2 = Vector2.ZERO

@onready var stateManager: StateManager = $StateManager

func _init() -> void:
	super("")

func _ready() -> void:
	stateManager.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	stateManager.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateManager.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateManager.processFrame(delta)
