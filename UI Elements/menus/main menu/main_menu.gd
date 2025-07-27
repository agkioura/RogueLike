extends CanvasLayer

@onready var play_button = $MainMenu/Buttons/PlayButton
@onready var options_button = $MainMenu/Buttons/OptionsButton
@onready var quit_button = $MainMenu/Buttons/QuitButton

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	options_button.pressed.connect(_on_options_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_play_pressed():
	Global.gameManager.loadLevel("res://levels/test_floor.tscn")

func _on_options_pressed():
	Global.gameManager.loadGui("res://UI Elements/menus/options/options.tscn")

func _on_quit_pressed():
	get_tree().quit()
