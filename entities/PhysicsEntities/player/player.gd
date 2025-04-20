class_name Player extends PhysicsEnity

@export var weaponType: String

@onready var animation = $AnimationPlayer
@onready var weapon = $Weapon
@onready var moveStateMachine = $MovementStateMachine
@onready var attackStateMachine = $AttackStateMachine

var facingDirection : Vector2

enum WEAPONS {
	SWORD,
	STAFF
}

func _init() -> void:
	super("aids")

func _ready() -> void:
	var type: int 
	match weaponType:
		"sword":
			type = WEAPONS.SWORD
		"staff": 
			type = WEAPONS.STAFF
		_:
			type = 0
	weapon.type = type
	$PlayerSprite/weaponSprite.frame = type
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
