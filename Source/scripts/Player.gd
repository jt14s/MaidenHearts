extends KinematicBody2D

var speed = 0
var MAX_SPEED = 600
var velocity = Vector2()

onready var sprite = get_node("Sprite")

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	var direction = Vector2()
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if direction:
		speed = MAX_SPEED
	else:
		speed = 0
	
	if direction.x < 0:
		sprite.set_flip_h(true)
	elif direction.x > 0:
		sprite.set_flip_h(false)
	
	velocity = speed * direction.normalized() * delta
	move_and_collide(velocity)
	