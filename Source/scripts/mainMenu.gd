extends Node

onready var play_button = get_node("UI/PlayButton")
onready var quit_button = get_node("UI/QuitButton")

var index

func _ready():
	global.change_pause_state(false)
	index = 0
	play_button.scale = Vector2(1.2,1.2)
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("move_up") and index != 0:
		play_button.scale = Vector2(1.2,1.2)
		quit_button.scale = Vector2(1.0,1.0)
		index -= 1
	if event.is_action_pressed("move_down") and index != 1:
		quit_button.scale = Vector2(1.2,1.2)
		play_button.scale = Vector2(1.0,1.0)
		index += 1
	if event.is_action_pressed("ui_accept"):
		if index == 0:
			get_tree().change_scene("res://scenes/characterSelect/characterSelect.tscn")
		elif index == 1:
			get_tree().quit()