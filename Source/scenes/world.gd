extends Node

onready var player = get_node("Player")

func _ready():
	player.position = Vector2(130,130)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass