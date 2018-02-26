extends Node

onready var resumeButton = get_node("ResumeButton")
onready var mainMenuButton = get_node("MainMenuButton")
onready var quitButton = get_node("QuitButton")

var index

func _ready():
	index = 0
	resumeButton.scale = Vector2(0.7,0.7)
	set_process_input(true)

func _input(event):
	if self.visible == true:
		if event.is_action_pressed("move_up") and index != 0:
			index -= 1
			if index == 0:
				resumeButton.scale = Vector2(0.7,0.7)
				mainMenuButton.scale = Vector2(0.5,0.5)
			elif index == 1:
				mainMenuButton.scale = Vector2(0.7,0.7)
				quitButton.scale = Vector2(0.5,0.5)
		if event.is_action_pressed("move_down") and index != 2:
			index += 1
			if index == 1:
				mainMenuButton.scale = Vector2(0.7,0.7)
				resumeButton.scale = Vector2(0.5,0.5)
			elif index == 2:
				quitButton.scale = Vector2(0.7,0.7)
				mainMenuButton.scale = Vector2(0.5,0.5)
		if event.is_action_pressed("ui_accept"):
			if index == 0:
				get_tree().set_pause(false)
				queue_free()
			elif index == 1:
				get_tree().change_scene("res://scenes/mainMenu/mainMenu.tscn")
				queue_free()
			elif index == 2:
				get_tree().quit()
