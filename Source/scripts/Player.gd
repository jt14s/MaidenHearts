extends KinematicBody2D

var speed = 0
var MAX_SPEED = 400
var velocity = Vector2()

onready var sprite = get_node("Sprite")
onready var spriteUp = preload("res://assets/characterSprites/player/paladin/up/up1.png")
onready var spriteDown = preload("res://assets/characterSprites/player/paladin/down/down1.png")
onready var spriteLeft = preload("res://assets/characterSprites/player/paladin/left/left1.png")
onready var spriteRight = preload("res://assets/characterSprites/player/paladin/right/right1.png")

func _ready():
	sprite.texture = global.player_sprite
	
func _process(delta):
	### direction calculation ###
	#
	var direction = Vector2()
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	### sprite update ###
	#
	### up and down
	if direction.y < 0:
		sprite.texture = spriteUp
	elif direction.y > 0:
		sprite.texture = spriteDown
	### left and right
	if direction.x < 0:
		sprite.texture = spriteLeft
	elif direction.x > 0:
		sprite.texture = spriteRight
	
	### movement ###
	#	
	velocity = MAX_SPEED * direction.normalized()
	move_and_slide(velocity)