extends Node

onready var playButton = get_node("UI/PlayButton")
onready var quitButton = get_node("UI/QuitButton")

var index

func _ready():
	get_tree().set_pause(false)
	index = 0
	playButton.scale = Vector2(1.2,1.2)
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("move_up") and index != 0:
		playButton.scale = Vector2(1.2,1.2)
		quitButton.scale = Vector2(1.0,1.0)
		index -= 1
	if event.is_action_pressed("move_down") and index != 1:
		quitButton.scale = Vector2(1.2,1.2)
		playButton.scale = Vector2(1.0,1.0)
		index += 1
	if event.is_action_pressed("ui_accept"):
		if index == 0:
			get_tree().change_scene("res://scenes/characterSelect/characterSelect.tscn")
		elif index == 1:
			get_tree().quit()