extends KinematicBody2D

var speed = 0
var MAX_SPEED = 600
var velocity = Vector2()

onready var sprite = get_node("Sprite")
onready var spriteUp = preload("res://assets/levelOne/player/standinup.png")
onready var spriteDownAndRight = preload("res://assets/levelOne/player/standin.png")
onready var spriteLeft = preload("res://assets/levelOne/player/standinleft.png")

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	### direction calculation ###
	#
	var direction = Vector2()
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	### sprite update ###
	#
	### up and down
	if direction.y < 0:
		sprite.texture = spriteUp
	elif direction.y > 0:
		sprite.texture = spriteDownAndRight
	### left and right
	if direction.x < 0:
		sprite.texture = spriteLeft
	elif direction.x > 0:
		sprite.texture = spriteDownAndRight
	
	### movement ###
	#
	if direction:
		speed = MAX_SPEED
	else:
		speed = 0
		
	velocity = speed * direction.normalized() * delta
	move_and_collide(velocity)
	