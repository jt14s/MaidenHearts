extends Node

onready var arrow = get_node("UI/Arrow")
var index = 0

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("ui_up") and index != 0:
		arrow.position.y -= 80
		index -= 1
	if event.is_action_pressed("ui_down") and index != 1:
		arrow.position.y += 80
		index += 1
	if event.is_action_pressed("ui_accept"):
		if index == 0:
			get_tree().change_scene("res://scenes/levelOne/world.tscn")
		elif index == 1:
			get_tree().quit()