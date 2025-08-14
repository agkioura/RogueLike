class_name Enemy extends PhysicsEnity

@export var speed: float
@export var stateMachine: StateMachine
@export var animation_player: AnimationPlayer
@export var enemy_sprite: Sprite2D

var target: PhysicsEnity
var hitDirection: Vector2

func setTarget(target: PhysicsEnity) -> void:
	self.target = target
	target.removed.connect(clearTarget)

func clearTarget() -> void:
	self.target = null

func _init() -> void:
	super("enemy")
	
func _ready() -> void:
	stateMachine.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	stateMachine.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateMachine.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateMachine.processFrame(delta)
