extends Node

var player_class_type

func change_pause_state(state):
	if state == true:
		get_tree().set_pause(true)
	else:
		get_tree().set_pause(false)