extends Node

onready var player = preload("res://scenes/levelOne/Player.tscn")

func _ready():
	var p = player.instance()
	p.connect("pausedGame", self, "game_pause")
	p.position = Vector2(30,30)
	add_child(p)
	
func game_pause():
	get_tree().set_pause(true)