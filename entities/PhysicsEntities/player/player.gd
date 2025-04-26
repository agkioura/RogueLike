class_name Player extends PhysicsEnity

@export var weaponType: String

@onready var sprite: Sprite2D = $PlayerSprite
@onready var weaponSprite: Sprite2D = $PlayerSprite/weaponSprite
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var weapon: Weapon = $Weapon
@onready var health: HealthComponent = $HealthComponent
@onready var label: Label = $CenterContainer/Label
@onready var stateManager: StateManager = $StateManager

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
	weaponSprite.frame = type
	stateManager.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	stateManager.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateManager.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateManager.processFrame(delta)
	var maxHealth = health.maxHealth
	var currentHealth = health.health
	label.text = str(currentHealth) + "/" + str(maxHealth)
