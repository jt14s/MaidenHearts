extends Node

onready var player = preload("res://scenes/Player.tscn")
var player_instance

func _ready():
	set_process_input(true)
	
	player_instance = player.instance()
	player_instance.position = Vector2(0,0)
	add_child(player_instance)

func _input(event):
	if event.is_action_pressed("pause"):
		game_pause()

func game_pause():
	$CanvasLayer2/PauseUI/PauseMenu.popup()
	get_tree().set_pause(true)