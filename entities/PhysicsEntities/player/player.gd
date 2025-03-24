extends PhysicsEnity

@onready var animation = $AnimationPlayer
@onready var weapon = $Weapon
@onready var moveStateMachine = $MovementStateMachine
@onready var attackStateMachine = $AttackStateMachine

var facing = "down"
var facingDirection : Vector2

func _init() -> void:
	super("aids")

func _ready() -> void:
	moveStateMachine.initialize(self)
	attackStateMachine.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	moveStateMachine.processInput(event)
	attackStateMachine.processInput(event)
	
func _physics_process(delta: float) -> void:
	moveStateMachine.processPhysics(delta)
	attackStateMachine.processPhysics(delta)
	
func _process(delta: float) -> void:
	moveStateMachine.processFrame(delta)
	attackStateMachine.processFrame(delta)
