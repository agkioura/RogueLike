class_name Skeleton extends Enemy

@export var stateMachine: StateMachine
@export var animation_player: AnimationPlayer
@export var enemy_sprite: Sprite2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var weapon: Sword = $Weapon

func setTarget(target: PhysicsEnity) -> void:
	self.target = target
	target.removed.connect(clearTarget)

func clearTarget() -> void:
	self.target = null

func _init() -> void:
	super("skeleton")
	
func _ready() -> void:
	stateMachine.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	stateMachine.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateMachine.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateMachine.processFrame(delta)
