extends Node

onready var player = preload("res://scenes/Player.tscn")

func _ready():
	var p = player.instance()
	p.position = Vector2(30,30)
	add_child(p)