extends Node

onready var resume_button = get_node("ResumeButton")
onready var main_menu_button = get_node("MainMenuButton")
onready var quit_button = get_node("QuitButton")

var index

func _ready():
	index = 0
	resume_button.scale = Vector2(0.7,0.7)
	set_process_input(true)

func _input(event):
	if self.visible == true:
		if event.is_action_pressed("move_up") and index != 0:
			index -= 1
			if index == 0:
				resume_button.scale = Vector2(0.7,0.7)
				main_menu_button.scale = Vector2(0.5,0.5)
			elif index == 1:
				main_menu_button.scale = Vector2(0.7,0.7)
				quit_button.scale = Vector2(0.5,0.5)
		if event.is_action_pressed("move_down") and index != 2:
			index += 1
			if index == 1:
				main_menu_button.scale = Vector2(0.7,0.7)
				resume_button.scale = Vector2(0.5,0.5)
			elif index == 2:
				quit_button.scale = Vector2(0.7,0.7)
				main_menu_button.scale = Vector2(0.5,0.5)
		if event.is_action_pressed("ui_accept"):
			if index == 0:
				self.hide()
				get_tree().set_pause(false)
			elif index == 1:
				get_tree().change_scene("res://scenes/mainMenu/mainMenu.tscn")
				queue_free()
			elif index == 2:
				get_tree().quit()
