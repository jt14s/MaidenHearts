extends KinematicBody2D

var speed = 0
var MAX_SPEED = 400
var velocity = Vector2()

onready var sprite = get_node("Sprite")
var spriteDirectionals = []

#paladin textures
var pali_spriteUp = preload("res://assets/characterSprites/player/paladin/up/up1.png")
var pali_spriteDown = preload("res://assets/characterSprites/player/paladin/down/down1.png")
var pali_spriteLeft = preload("res://assets/characterSprites/player/paladin/left/left1.png")
var pali_spriteRight = preload("res://assets/characterSprites/player/paladin/right/right1.png")

#mage textures
var mage_spriteUp = preload("res://assets/characterSprites/player/mage/up/up1.png")
var mage_spriteDown = preload("res://assets/characterSprites/player/mage/down/down1.png")
var mage_spriteLeft = preload("res://assets/characterSprites/player/mage/left/left1.png")
var mage_spriteRight = preload("res://assets/characterSprites/player/mage/right/right1.png")

#assassin textures
var assassin_spriteUp = preload("res://assets/characterSprites/player/assassin/up/up1.png")
var assassin_spriteDown = preload("res://assets/characterSprites/player/assassin/down/down1.png")
var assassin_spriteLeft = preload("res://assets/characterSprites/player/assassin/left/left1.png")
var assassin_spriteRight = preload("res://assets/characterSprites/player/assassin/right/right1.png")

func _ready():
	if global.player_class_type == "P":
		spriteDirectionals = [pali_spriteUp, pali_spriteRight, pali_spriteDown, pali_spriteLeft]
	elif global.player_class_type == "M":
		spriteDirectionals = [mage_spriteUp, mage_spriteRight, mage_spriteDown, mage_spriteLeft]
	elif global.player_class_type == "A":
		spriteDirectionals = [assassin_spriteUp, assassin_spriteRight, assassin_spriteDown, assassin_spriteLeft]
	#elif global.class_type == "a":
	#	spriteDirectionals = [alien_spriteUp, alien_spriteRight, alien_spriteDown, alien_spriteLeft]
	sprite.texture = spriteDirectionals[1]
	
	set_physics_process(true)
		
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
		sprite.texture = spriteDirectionals[0]
	elif direction.y > 0:
		sprite.texture = spriteDirectionals[2]
	### left and right
	if direction.x < 0:
		sprite.texture = spriteDirectionals[3]
	elif direction.x > 0:
		sprite.texture = spriteDirectionals[1]
	
	### movement ###
	#
	if direction != Vector2():
		speed = MAX_SPEED
	else:
		speed = 0
		
	velocity = speed * direction.normalized()
	move_and_slide(velocity)