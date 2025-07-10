class_name Enemy extends PhysicsEnity

@export var speed: float
@export var stateManager: StateManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var enemy_sprite: Sprite2D = $EnemySprite

var target: PhysicsEnity
var hitDirection: Vector2

func _init() -> void:
	super("enemy")
	
func _ready() -> void:
	stateManager.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	stateManager.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateManager.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateManager.processFrame(delta)
