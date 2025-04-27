class_name Enemy extends PhysicsEnity

@export var weaponType: String
@onready var weapon = $Weapon
enum WEAPONS {
	SWORD,
	STAFF
}

@onready var stateManager: StateManager = $StateManager
@onready var healthBar: ProgressBar = $healthBar
@onready var health: HealthComponent = $HealthComponent
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $EnemySprite
@onready var weaponSprite: Sprite2D = $EnemySprite/weaponSprite
@onready var attackRange: Area2D = $AttackRange
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
	stateManager.initialize(self)
	

func _unhandled_input(event: InputEvent) -> void:
	stateManager.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateManager.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateManager.processFrame(delta)
	var maxHealth = health.maxHealth
	var currentHealth = health.health
	healthBar.value = currentHealth * 100 / maxHealth
