extends Node

onready var player_sprite = preload("res://assets/characterSprites/player/paladin/right/right1.png")

func change_pause_state(state):
	if state == true:
		get_tree().set_pause(true)
	else:
		get_tree().set_pause(false)