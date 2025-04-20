extends PhysicsEnity

@onready var stateMachine = $StateMachine
@onready var label = $CenterContainer/Label
@onready var health = $HealthComponent

var speed: float = 30.0

func _init() -> void:
	super("npc")

func _ready() -> void:
	stateMachine.initialize(self)

func _unhandled_input(event: InputEvent) -> void:
	stateMachine.processInput(event)
	
func _physics_process(delta: float) -> void:
	stateMachine.processPhysics(delta)
	
func _process(delta: float) -> void:
	stateMachine.processFrame(delta)
	var maxHealth = health.maxHealth
	var currentHealth = health.health
	label.text = str(currentHealth) + "/" + str(maxHealth)
