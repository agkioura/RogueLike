class_name Enemy extends PhysicsEnity

@export var weaponType: String
@onready var weapon = $Weapon
enum WEAPONS {
	SWORD,
	STAFF
}

@onready var stateMachine: StateMachine = $MovementStateMachine
@onready var attackStateMachine: StateMachine = $AttackStateMachine
@onready var label: Label = $CenterContainer/Label
@onready var health: HealthComponent = $HealthComponent
var target: PhysicsEnity

var speed: float = 40.0

func _init() -> void:
	super("npc")

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
	stateMachine.initialize(self)
	attackStateMachine.initialize(self)
	

func _unhandled_input(event: InputEvent) -> void:
	stateMachine.processInput(event)
	attackStateMachine.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateMachine.processPhysics(delta)
	attackStateMachine.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateMachine.processFrame(delta)
	attackStateMachine.processFrame(delta)
	var maxHealth = health.maxHealth
	var currentHealth = health.health
	label.text = str(currentHealth) + "/" + str(maxHealth)
