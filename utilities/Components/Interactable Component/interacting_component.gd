class_name InteractingComponent extends Node2D

@onready var interact_range: Area2D = $InteractRange
@onready var interact_label: Label = $InteractLabel

@export var inventoryComponent: InventoryComponent

var current_interractions: Array = []
var can_interact: bool = true

func _ready() -> void:
	interact_range.area_entered.connect(_on_interact_range_area_entered)
	interact_range.area_exited.connect(_on_interact_range_area_exited)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("interact") and can_interact:
		if current_interractions and inventoryComponent.checkInventoryCapacity():
			can_interact = false
			
			var item = current_interractions[0]
			inventoryComponent.add(item)
			item.interact()
			
			
			can_interact = true

func _process(_delta: float) -> void:
	interact_label.text = ""
	if current_interractions and can_interact:
		if current_interractions.size() > 2: current_interractions.sort_custom(_sort_by_nearest)
		interact_label.text =  "E to interact " + current_interractions[0].interact_name


func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1)
	var area2_dist = global_position.distance_to(area2)
	return area1_dist < area2_dist

func _on_interact_range_area_entered(area: Area2D) -> void:
	if area is Interactable:
		current_interractions.push_back(area.get_parent())
		interact_label.visible = true

func _on_interact_range_area_exited(area: Area2D) -> void:
	current_interractions.erase(area.get_parent())
	interact_label.visible = false
