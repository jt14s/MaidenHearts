extends Node

onready var player = preload("res://scenes/levelOne/Player.tscn")
onready var pauseMenu = preload("res://scenes/PauseMenu/PauseMenu.tscn")
var playerInstance

func _ready():
	set_process_input(true)
	
	playerInstance = player.instance()
	playerInstance.position = Vector2(0,0)
	add_child(playerInstance)
	
func _input(event):
	if event.is_action_pressed("pause"):
		game_pause()
	
func game_pause():
	var pauseMenuInstance = pauseMenu.instance()
	add_child(pauseMenuInstance)
	pauseMenuInstance.popup_exclusive = true
	pauseMenuInstance.popup()
	get_tree().set_pause(true)