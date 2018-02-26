extends Node

onready var selector = get_node("Selector")
var index = 0

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("move_left") and index != 0:
		index -= 1
		selector.position.x -= 288
	elif event.is_action_pressed("move_right") and index != 3:
		index += 1
		selector.position.x += 288
	if event.is_action_pressed("ui_accept"):
		if index == 0:
			global.playerSprite = preload("res://assets/characterSprites/player/paladin/right/right1.png")
			get_tree().change_scene("res://scenes/levelOne/levelOne.tscn")